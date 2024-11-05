import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:apiClient/main.dart';
import 'package:stadtplan/presentation/google_search/bloc/bloc.dart';
import 'package:stadtplan/presentation/google_search/utils/google_api_search_utils.dart';
import 'package:stadtplan/presentation/google_search/widget/places_autocomplete_text_field_widget.dart';
import 'package:stadtplan/presentation/google_search/widget/prediction_list_item_widget.dart';
import 'package:stadtplan/presentation/widgets/bottom_sheet_header_widget.dart';
import 'package:stadtplan/presentation/widgets/bottom_sheet_wrap_container.dart';
import 'package:stadtplan/presentation/widgets/no_data_found_widget.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/utils/snackbar_mixin.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:uuid/uuid.dart';

class GoogleSearchAddressWidget extends StatefulWidget {
  const GoogleSearchAddressWidget({
    super.key,
    required this.bloc,
    required this.onAddressSelected,
    required this.checkZipCode,
    this.address,
    required this.isFromMapScreen
  });

  static const Key listKey = Key('PlacesAutocompleteResultWidget.listKey');

  static const Key emptyKey = Key('PlacesAutocompleteResultWidget.emptyKey');

  final GoogleSearchBloc bloc;

  final ValueChanged<AddressModel> onAddressSelected;

  final bool checkZipCode;

  final String? address;

  final bool isFromMapScreen;

  @override
  State<GoogleSearchAddressWidget> createState() =>
      _GoogleSearchAddressWidgetState();
}

class _GoogleSearchAddressWidgetState extends State<GoogleSearchAddressWidget>
    with SnackBarMixin {
  String _sessionToken = '';
  Timer? _debounce;
  final BehaviorSubject<String> _queryBehavior =
  BehaviorSubject<String>.seeded('');
  String _text = '';

  @override
  void dispose() {
    super.dispose();
    _queryBehavior.close();
  }

  @override
  void initState() {
    _sessionToken = const Uuid().v4();
    _queryBehavior.stream.listen(_performSearch);
    _onQueryChanged(_text);
    if (widget.address != null && widget.address!.isNotEmpty) {
      _performSearch(widget.address!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSearchBloc, GoogleSearchState>(
      bloc: widget.bloc,
      listener: (BuildContext context, GoogleSearchState state) async {
        if (state is ErrorGooglePlacesState) {
          showSnackBar(
            message: state.error.toString(),
            context: context,
          );
        } else if (state is SuccessGooglePlacesDetailsState) {
          final AddressModel addressModel =
          await GoogleApiSearchUtils.parsePlace(
            prediction: state.placeDetailsModel,
          );
          if (widget.checkZipCode &&
              (addressModel.postalCode.toString().isEmpty ||
                  addressModel.streetName.toString().isEmpty) &&
              context.mounted) {
            return showSnackBar(
              message: 'Please provide a valid ZIP code.',
              context: context,
            );
          }
          widget.onAddressSelected(addressModel);
        } else if (state is ErrorGooglePlacesDetailsState) {
          showSnackBar(
            message: 'No data found.',
            context: context,
          );
        }
      },
      builder: (BuildContext context, GoogleSearchState state) {
        return BottomSheetWrapContainer(
          childScrollViewNeeded: true,
          child: Column(
            children: <Widget>[
              BottomSheetHeaderWidget(
                bottomPadding: widget.isFromMapScreen ? true : false,
                isCloseButtonVisible: !widget.isFromMapScreen,
              ),
              PlacesAutoCompleteTextField(
                onChanged: (String value) {
                  setState(() {
                    _text = value;
                    _onQueryChanged(value);
                  });
                },
                onClearClicked: handleEmptyData,
                onSubmitted: () {
                  _performSearch(_text);
                },
                isFromMapScreen: widget.isFromMapScreen,
                value: widget.address ?? '',
              ),
              placesAutocompleteResultWidget(state),
            ],
          ),
        );
      },
    );
  }

  Future<void> _performSearch(String value) async {
    if (value.isNotEmpty) {
      widget.bloc.add(
        FetchGooglePlaceAddressEvent(
          input: value,
          sessionToken: _sessionToken,
        ),
      );
    } else {
      handleEmptyData();
    }
  }

  void handleEmptyData() {
    widget.bloc.add(const EmptyStateEvent());
  }

  void _onQueryChanged(String text) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _queryBehavior.add(text);
    });
  }

  Widget placesAutocompleteResultWidget(
      GoogleSearchState state,
      ) {
    if (state is LoadingGoogleSearchState) {
      return _buildLoader();
    } else if (state is SuccessGooglePlacesState) {
      return _buildList(state.predictions);
    } else {
      return Expanded(
        child: NoDataFoundWidget(
          title: 'No data found.',
          icon: ImageAssets.icSearch(
            color: Palette.grey50,
          ),
        ),
      );
    }
  }

  Widget _buildLoader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.medium),
      child: SizedBox(
        height: 2,
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Palette.primary),
        ),
      ),
    );
  }

  Widget _buildList(List<PredictionsDataModel> predictions) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacings.medium),
        child: ListView.builder(
          key: GoogleSearchAddressWidget.listKey,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: predictions.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                widget.bloc.add(
                  FetchGooglePlaceDetailsEvent(
                    placeId: predictions[index].placeId,
                    sessionToken: _sessionToken,
                  ),
                );
              },
              child: PredictionListItemWidget(
                predictionsDataModel: predictions.elementAt(index),
                text: _text,
              ),
            );
          },
        ),
      ),
    );
  }
}
