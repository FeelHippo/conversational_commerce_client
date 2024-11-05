import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sprintf/sprintf.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/widgets/bottom_sheet_header_widget.dart';
import 'package:stadtplan/presentation/widgets/bottom_sheet_wrap_container.dart';
import 'package:stadtplan/presentation/widgets/components/button_primary.dart';
import 'package:stadtplan/presentation/widgets/textlabels/text_paragraph_regular.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/utils/dotenv_utils.dart';

class LocationPermissionDeniedWidget extends StatefulWidget {
  const LocationPermissionDeniedWidget({
    required this.cancelClicked,
    required this.locationPermissionGranted,
    Key? key,
  }) : super(key: key);

  final VoidCallback cancelClicked;
  final VoidCallback locationPermissionGranted;

  @override
  _LocationPermissionDeniedWidget createState() =>
      _LocationPermissionDeniedWidget();
}

class _LocationPermissionDeniedWidget
    extends State<LocationPermissionDeniedWidget> with WidgetsBindingObserver {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final geolocationStatus = await Geolocator.checkPermission();
      if (geolocationStatus == LocationPermission.always ||
          geolocationStatus == LocationPermission.whileInUse) {
        widget.locationPermissionGranted.call();
        if (mounted) {
          AppNavigator.of(context).pop();
        }
      } else {
        await Geolocator.requestPermission();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BottomSheetWrapContainer(
        heightTag: 'height_medium',
        child: Column(
          children: <Widget>[
            BottomSheetHeaderWidget(
              onCloseCallBack: (){
                widget.cancelClicked.call();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: Spacings.medium,
            ),
            ImageAssets.arrowRight(),
            const SizedBox(
              height: Spacings.medium,
            ),
            ButtonPrimary(
              onTap: () {
                Geolocator.openAppSettings();
              },
              text: 'OK',
            ),
          ],
        ),
      ),
    );
  }
}
