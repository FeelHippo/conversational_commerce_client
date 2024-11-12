import 'dart:async';
import 'dart:collection';
import 'dart:ui' as ui show Image;
import 'dart:ui';

import 'package:apiClient/main.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:stadtplan/constants/list_constants.dart';
import 'package:stadtplan/presentation/common/map_utils.dart';
import 'package:stadtplan/presentation/dashboard_screen/models/pois_view_model.dart';
import 'package:stadtplan/presentation/dashboard_screen/pois_bloc/pois_bloc.dart';
import 'package:stadtplan/presentation/dashboard_screen/position_bloc/position_bloc.dart';
import 'package:stadtplan/presentation/dashboard_screen/utils/marker_utils.dart';
import 'package:stadtplan/presentation/dashboard_screen/widgets/center_change_notifier.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/navigation/app_routes.dart';
import 'package:stadtplan/presentation/widgets/app_scaffold.dart';
import 'package:stadtplan/utils/haversine.dart';
import 'package:stadtplan/utils/snackbar_mixin.dart';
import 'package:storage/main.dart';

/// Class MapWidget
///
/// Used to Call Google Map With Style & Marker
/// Also used show Demo Sheet & Fuel Selection pop up
class MapWidget extends StatefulWidget {
  /// Constructor
  const MapWidget({
    super.key,
    required this.centerChangeNotifier,
    required this.markerImageUtils,
    required this.userPreferences,
  });

  /// Used for user location
  final CenterChangeNotifier centerChangeNotifier;
  final MarkerUtils markerImageUtils;
  final UserPreferences userPreferences;

  @override
  State<StatefulWidget> createState() => MapWidgetState();
}

/// State Widget
class MapWidgetState extends State<MapWidget>
    with
        AutomaticKeepAliveClientMixin<MapWidget>,
        WidgetsBindingObserver,
        SnackBarMixin {
  static const ValueKey<String> locationPermissionSnackBarKey =
      ValueKey<String>('MapWidgetState.LocationPermissionSnackBarKey');
  final GlobalKey _mapGlobalKey = GlobalKey();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late POIsBloc _poisBloc;

  late LatLng currentUserPosition;
  late List<POIViewModel> pois;

  int _radius = 5000;

  /// User Icon
  BitmapDescriptor? _mapMeIcon;

  BitmapDescriptor? _mapSearchResultIcon;

  /// User Location Stream
  StreamSubscription<Position>? _userPositionStream;

  /// Previous Position
  LatLng? _lastFetchedPosition;

  /// Marker List
  Marker? userMarker;

  /// Marker Set
  Set<Marker> mapSetMarkers = <Marker>{};

  /// Marker Image Map
  Map<String, BitmapDescriptor?> mapImageMarkers =
      <String, BitmapDescriptor?>{};

  /// mapStyle
  String? mapStyle;

  /// zoomLevel
  double zoomLevel = 14;

  GoogleMapController? mapController;

  bool centerClicked = false;

  bool isCameraMoving = false;

  bool hasZoomed = false;

  bool isBlocLoading = false;

  bool doCenterNotified = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    widget.centerChangeNotifier.addListener(moveCameraToCurrentLocation);
    WidgetsBinding.instance.addObserver(this);
    pois = <POIViewModel>[];
    BlocProvider.of<PositionBloc>(context)..add(StartTrackingPositionEvent());
    _poisBloc = BlocProvider.of<POIsBloc>(context);
    initData();
  }

  @override
  void dispose() {
    _userPositionStream?.cancel();
    widget.centerChangeNotifier.removeListener(moveCameraToCurrentLocation);
    WidgetsBinding.instance.removeObserver(this);
    mapController?.dispose();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await doResumeAppLifecycle();
      await doRefreshAllPois();
    }
  }

  Future<void> doResumeAppLifecycle() async {
    await mapController?.setMapStyle(mapStyle);
    // Check if GPS enabled after confirmation from GPS dialog
    if (centerClicked) {
      centerClicked = false;
      await moveMarkerToCurrentLocation();
    }
  }

  Future<void> doRefreshAllPois() async {
    final LatLngBounds bounds = await getLatLngBounds();
    final LatLng currentCenter = await getCenter();
    _poisBloc.add(FetchPOIsEvent(bounds));
    _lastFetchedPosition = currentCenter;
  }

  Future<void> moveMarkerToCurrentLocation() async {
    widget.centerChangeNotifier.centerMe();
  }

  Future<void> moveCameraToCurrentLocation() async {
    if (widget.centerChangeNotifier.isCenterMe) {
      // move user marker to current location
      await _moveCamera(currentUserPosition);
    }
  }

  /// Init data with Bloc & Marker Bitmap
  void initData() async {
    try {
      // Listener for user current location icon
      widget.centerChangeNotifier.addListener(() async {
        if (widget.centerChangeNotifier.isCenterMe) {
          final LocationPermission geolocationStatus =
              await Geolocator.checkPermission();
          // if permission denied forever then open location permission BottomSheet
          if (geolocationStatus == LocationPermission.deniedForever ||
              geolocationStatus == LocationPermission.denied) {
            if (mounted) {
              await moveToLocationPermissionScreen();
            }
          } else {
            // initial POIs fetch
            await loadMapData();
            // initial user marker
            userMarker ??= _getUserMarker();
          }
        }
      });
    } catch (e) {
      Fimber.d(e.toString());
    }
  }

  Future<void> moveToLocationPermissionScreen() async {
    await AppNavigator.of(context).push(
      AppRoutes.locationPermissionDeniedScreen(
        cancelClicked: () {},
        locationPermissionGranted: () async {
          //Hide bottom permission denied SnackBar after permission approved
          AppScaffold.of(context)
              ?.removeSnackBar(locationPermissionSnackBarKey);
          //Check if GPS is not enabled then request for GPS dialog
          if (!await location.Location().serviceEnabled()) {
            await location.Location().requestService();
            centerClicked = true;
          } else {
            // If GPS is enabled then get user current position
            await moveMarkerToCurrentLocation();
          }
        },
      ),
    );
  }

  /// Load Map data
  Future<void> loadMapData() async {
    try {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);

      if (_mapMeIcon == null) {
        final AssetBundleImageKey resolvedMarkerImage =
            await const AssetImage('assets/common/user_map_pin.png')
                .obtainKey(imageConfiguration);
        final Uint8List markerIcon =
            await MapUtils.getBytesFromAsset(resolvedMarkerImage.name);
        _mapMeIcon = BitmapDescriptor.fromBytes(markerIcon);
      }

      if (_mapSearchResultIcon == null) {
        final AssetBundleImageKey resolvedMarkerImage =
            await const AssetImage('assets/common/poi.png')
                .obtainKey(imageConfiguration);
        final Uint8List markerIcon =
            await MapUtils.getBytesFromAsset(resolvedMarkerImage.name);
        _mapSearchResultIcon = BitmapDescriptor.fromBytes(markerIcon);
      }
    } catch (e) {
      Fimber.e(e.toString());
    }
  }

  Future<List<POIViewModel>> _filterPOIs(List<POIViewModel> pois,
      Map<QuickFilters, bool> quickFilterStatus) async {
    // toggle favorite filter
    if (quickFilterStatus[QuickFilters.favorite] == true) {
      pois = pois;
    }
    return pois;
  }

  Future<void> moveCameraToAddress(AddressModel address) async {
    widget.centerChangeNotifier.clearCenter();
    final LatLng locationState = LatLng(address.latitude, address.longitude);
    await _moveCamera(locationState);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<POIsBloc, POIsState>(
      bloc: _poisBloc,
      listener: (BuildContext context, POIsState state) async {
        if (state.error != null) {
          showSnackBar(
            message: state.error.toString(),
            context: context,
          );
        }
        if (state.addressModel != null) {
          // the bloc always resets addressModel when loading
          // this block will only be reached if the user interacts with the
          // Google Places widget. This is turn will trigger a POIs fetch
          await moveCameraToAddress(state.addressModel!);
        }
        if (state.pois != null) {
          // new POIs are fetched if:
          // initial fetch, when the map widget is initiated
          // when an address model is selected from the Google Places widget
          // when the Google Map is on idle state.
          pois = await _filterPOIs(
            state.pois!,
            state.quickFilterStatus ?? ListConstants.quickFilterStatus,
          );
          await updateSetMarkers();
        }
        if (state.loading == LoadingPois.loading) {
          setState(() {
            isBlocLoading = true;
          });
        } else {
          setState(() {
            isBlocLoading = false;
          });
        }
      },
      // rebuild if the user has interacted with the Google Places widget
      // or if the list of POIs has changed following a state change
      buildWhen: (POIsState previous, POIsState current) {
        final bool addressModelHasChanged =
            previous.addressModel != current.addressModel;
        final bool poiListsAreNotEqual =
            !listEquals(previous.pois, current.pois);
        return addressModelHasChanged || poiListsAreNotEqual;
      },
      builder: (BuildContext context, POIsState state) {
        return BlocListener<PositionBloc, PositionState>(
          listener: (BuildContext context, PositionState state) {
            currentUserPosition = state.currentPosition;
            isBlocLoading = state.loading;
          },
          child: FutureBuilder<bool>(
            future: _isMapStyleInit(),
            builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
              return _buildGoogleMaps(snapshot.data ?? isBlocLoading);
            },
          ),
        );
      },
    );
  }

  Future<void> updateSetMarkers() async {
    final Set<Marker> tempMapSetMarkers = <Marker>{};
    for (final POIViewModel poi in pois) {
      tempMapSetMarkers.add(await getPlace(poi));
    }
    mapSetMarkers = tempMapSetMarkers;
  }

  Future<bool> _isMapStyleInit() async {
    // render map style
    mapStyle ??=
        await rootBundle.loadString('assets/common/files/map_style.json');
    // display the map
    return true;
  }

  /// Build Google Maps with marker & style
  Widget _buildGoogleMaps(bool isReady) {
    return isReady
        ? GoogleMap(
            key: _mapGlobalKey,
            zoomControlsEnabled: false,
            minMaxZoomPreference: const MinMaxZoomPreference(8.8, 20),
            onCameraIdle: () async {
              if (mapController !=
                          null && // GoogleMaps controller is initialized
                      isCameraMoving && // user has been actively changing location
                      _lastFetchedPosition !=
                          null // map has already been populated with POIs
                  ) {
                if (await needsToRefreshPois()) {
                  await doRefreshAllPois();
                }
                isCameraMoving = false;
                hasZoomed = false;
              }
            },
            onTap: (LatLng position) {},
            onCameraMove: onCameraMove,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}
              ..add(Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer()))
              ..add(Factory<PanGestureRecognizer>(() => PanRecognizer(() {
                    widget.centerChangeNotifier.clearCenter();
                  }))),
            myLocationButtonEnabled: false,
            markers: getMarkers(),
            initialCameraPosition: _getCameraPosition(
              currentUserPosition,
              zoom: zoomLevel,
            ),
            mapToolbarEnabled: false,
            onMapCreated: (GoogleMapController controller) async {
              if (mapStyle != null && mapStyle!.isNotEmpty) {
                await controller.setMapStyle(mapStyle);
              }
              if (!_controller.isCompleted) {
                _controller.complete(controller);
              }
              mapController = controller;
              await doRefreshAllPois();
              doCenterNotified = true;
            },
          )
        : const Center(child: CircularProgressIndicator());
  }

  Set<Marker> getMarkers() {
    final HashSet<Marker> tmpMarkers = HashSet<Marker>();

    tmpMarkers.addAll(mapSetMarkers);

    if (userMarker != null) {
      tmpMarkers.add(userMarker!);
    }

    return tmpMarkers;
  }

  /// =====================================================================================================================================

  Future<Marker> getPlace(POIViewModel poi) async {
    return Marker(
      markerId: MarkerId(poi.position.toString()),
      position: poi.position,
      onTap: () => _handlePOIAction(poi),
      icon: await _getCustomMarkerBitmap(
            model: poi,
          ) ??
          BitmapDescriptor.defaultMarker,
    );
  }

  /// On Camera Move
  Future<void> onCameraMove(CameraPosition position) async {
    if (zoomLevel != position.zoom && mapController != null) {
      _radius = await _getRadius(mapController!);
      hasZoomed = true;
    }
    zoomLevel = position.zoom;
    _getCameraPosition(
      position.target,
      zoom: zoomLevel,
    );
    isCameraMoving = true;
  }

  /// return screen radius in meters
  Future<int> _getRadius(
    GoogleMapController mapController, {
    int extent = 2,
  }) async {
    final LatLngBounds bounds = await mapController.getVisibleRegion();
    return Haversine.formula(
          bounds.northeast.latitude,
          bounds.northeast.longitude,
          bounds.southwest.latitude,
          bounds.southwest.longitude,
        ).round() *
        extent;
  }

  /// This method is triggered when the camera is idle e.g. user has interacted with the map
  Future<bool> needsToRefreshPois() async {
    final LatLng currentCenter = await getCenter();

    // center position of last POIs fetch
    final double lastFetchLon = _lastFetchedPosition?.longitude ?? 0;
    final double lastFetchLat = _lastFetchedPosition?.latitude ?? 0;
    // center position of current visible location
    final double currentLon = currentCenter.longitude;
    final double currentLat = currentCenter.latitude;

    // _radius is equal to visible map radius in meters * an extent (default == 2)
    // this means the area considered is wider that the one currently visible
    // and POIs are fetched for an area wider than the visible one, and cached
    bool isNewPositionReached = false;

    // Haversine.formula == distance in meters between two coordinates
    // == distance between last fetch position and current user position e.g. 100m
    // _radius / 1.5 == (visible map area * extent) / 1.5
    // e.g. (1000m * 2) / 1.5 = 1333m
    // == if current position is approaching radius limit => re-fetch POIs
    // else use the ones cached
    final bool isApproachingLimit =
        Haversine.formula(lastFetchLat, lastFetchLon, currentLat, currentLon) >
            _radius / 1.5;

    if (isApproachingLimit || hasZoomed) {
      isNewPositionReached = true;
    }

    return isNewPositionReached;
  }

  Future<void> zoomIn(LatLng location) async {
    final GoogleMapController controller = await _controller.future;
    zoomLevel = zoomLevel + 1;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        _getCameraPosition(
          location,
          zoom: zoomLevel,
        ),
      ),
    );
  }

  void _handlePOIAction(POIViewModel model) {
    // TODO(Filippo) define actions
  }

  /// Get User marker with Icon
  Marker? _getUserMarker() {
    if (_mapMeIcon != null) {
      return Marker(
        markerId: MarkerId(MarkerUtils.userMarkerId),
        position: currentUserPosition,
        icon: _mapMeIcon!,
      );
    }
    return null;
  }

  Future<LatLngBounds> getLatLngBounds() async {
    final LatLngBounds bounds = await mapController!.getVisibleRegion();
    return bounds;
  }

  /// Get Camera Current Center Position
  Future<LatLng> getCenter() async {
    if (mapController != null) {
      final LatLngBounds bounds = await getLatLngBounds();
      final LatLng centerLatLng = LatLng(
        (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
      );

      return centerLatLng;
    }
    return currentUserPosition;
  }

  Future<void> setCameraPosition(LatLng position) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        _getCameraPosition(position, zoom: 10),
      ),
    );
  }

  /// Move Camera to position
  Future<void> _moveCamera(LatLng position) async {
    if (mounted) {
      await setCameraPosition(position);
      setState(() {
        userMarker = _getUserMarker();
      });
    }
  }

  /// Get Camera Position Using Lat Long
  CameraPosition _getCameraPosition(LatLng target, {double? zoom}) {
    // When current location marker moved at that time Zoom level would not be changed
    return CameraPosition(
      target: target,
      zoom: zoom ?? zoomLevel,
    );
  }

  /// _getCustomMarkerBitmap
  /// This method is used to generate bitmap
  /// POI marker through custom painter
  Future<BitmapDescriptor?> _getCustomMarkerBitmap({
    required POIViewModel model,
  }) async {
    /// markerImage depends on model.brand
    /// condition for marker background image
    final String url = model.iconUrl;

    if (mapImageMarkers[url] != null) {
      return mapImageMarkers[url];
    }

    final BitmapDescriptor? markerImage =
        await widget.markerImageUtils.getMarkerImageFromUrl(
      url,
      context,
    );
    mapImageMarkers[url] = markerImage;
    return markerImage;
  }

  Future<BitmapDescriptor> generateCustomMarkerWithOnlyIcon(
    ui.Image markerImage,
    POIViewModel model,
  ) async {
    /// Init the [Canvas] and [PictureRecorder]
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..style = PaintingStyle.stroke;

    /// For management of image marker with Rect
    final Size imageSize =
        Size(markerImage.width.toDouble(), markerImage.height.toDouble());
    final Rect src = Offset.zero & imageSize;

    final Rect dst = Offset.zero & Size(imageSize.width, imageSize.height);
    canvas.drawImageRect(
      markerImage,
      src,
      dst,
      paint1..blendMode = BlendMode.dstATop,
    );

    /// For the render text string in marker
    TextPainter(
      textDirection: TextDirection.ltr,
    )
      ..layout()
      ..paint(
        canvas,
        Offset(
          (imageSize.width / 2),
          (imageSize.width / 3.5),
        ),
      );

    /// to convert canvas into [ui.Image]
    final ui.Image img = await pictureRecorder
        .endRecording()
        .toImage(imageSize.width.toInt(), imageSize.height.toInt());
    final ByteData? data = await img.toByteData(format: ImageByteFormat.png);

    /// return BitmapDescriptor of marker
    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }
}

class PanRecognizer extends PanGestureRecognizer {
  PanRecognizer(this.action);
  final Function action;

  @override
  void resolve(GestureDisposition disposition) {
    super.resolve(disposition);
    action();
  }
}
