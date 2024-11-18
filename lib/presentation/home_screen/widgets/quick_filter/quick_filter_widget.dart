import 'dart:io';

import 'package:apiClient/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadtplan/constants/list_constants.dart';
import 'package:stadtplan/presentation/dashboard_screen/pois_bloc/pois_bloc.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/navigation/app_routes.dart';
import 'package:stadtplan/presentation/widgets/app_card.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';

class QuickFilterWidget extends StatefulWidget {
  const QuickFilterWidget({
    super.key,
  });

  static Key quickFilterWidgetWidgetLoadingCircularProgressIndicatorKey =
      const Key('QuickFilterWidget-Loading-circularProgressIndicator');

  static Key quickFilterWidgetLogoImageKey =
      const Key('QuickFilterWidget-Logo-image');

  static Key quickFilterWidgetSearchImageKey =
      const Key('QuickFilterWidget-Search-image');

  static Key quickFilterWidgetPowerImageKey =
      const Key('QuickFilterWidget-Power-image');

  static Key quickFilterWidgetFastImageKey =
      const Key('QuickFilterWidget-Fast-image');

  static Key quickFilterWidgetDisplayNameLabelKey =
      const Key('QuickFilterWidget-display-name-label');

  static Key quickFilterWidgetSearchInkWellKey =
      const Key('QuickFilterWidget-search-InkWell');

  static Key quickFilterWidgetFilterInkWellKey =
      const Key('QuickFilterWidget-filter-InkWell');

  @override
  State<QuickFilterWidget> createState() => _QuickFilterWidgetState();

  static Key getFilterCardKey(int index) {
    return Key('QuickFilter-card-$index');
  }

  static Key getFilterCardDisplayNameKey(String ref) {
    return Key('QuickFilterWidget-display-name-label-$ref');
  }

  static Key getFilterWidgetLogoImageKey(String ref) {
    return Key('QuickFilterWidget-Logo-image-$ref');
  }
}

class _QuickFilterWidgetState extends State<QuickFilterWidget> {
  bool isLoading = false;
  late Map<QuickFilters, bool> quickFilterStatus;
  late POIsBloc _poisBloc;
  late AppNavigator _appNavigator;

  @override
  void initState() {
    super.initState();
    quickFilterStatus = ListConstants.quickFilterStatus;
    _poisBloc = BlocProvider.of<POIsBloc>(context);
    _appNavigator = AppNavigator.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return showWidget(ListConstants.getQuickFilterAcois(context));
  }

  void onQuickFilterTap(String filterSelected) {
    _poisBloc.add(FilterPOIsEvent(filterSelected));
  }

  void onPredictionTap(AddressModel addressModel) {
    _poisBloc.add(MoveMapToLocationEvent(addressModel));
  }

  Widget showWidget(List<AcoisModel> listQuickFilter) {
    return BlocListener<POIsBloc, POIsState>(
      bloc: _poisBloc,
      listener: (BuildContext context, POIsState state) async {
        if (state.loading == LoadingPois.loading) {
          setState(() {
            isLoading = true;
          });
        } else {
          setState(() {
            isLoading = false;
            quickFilterStatus = state.quickFilterStatus ?? quickFilterStatus;
          });
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: Spacings.medium,
              top: Platform.isAndroid ? Spacings.small : Spacings.small,
              bottom: Spacings.medium),
          child: SizedBox(
            height: Spacings.xxxLarge,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: listQuickFilter.length,
              itemBuilder: (BuildContext context, int index) {
                final AcoisModel acoisViewModel =
                    listQuickFilter.elementAt(index);
                final bool? currentStatus =
                    quickFilterStatus[acoisViewModel.mode];
                if (acoisViewModel.mode == QuickFilters.search) {
                  return Row(
                    children: <Widget>[
                      Container(
                        width: Spacings.xxxLarge,
                        height: Spacings.xxxLarge,
                        child: InkWell(
                          key: QuickFilterWidget
                              .quickFilterWidgetSearchInkWellKey,
                          onTap: () {
                            _appNavigator.push(
                              AppRoutes.googleSearchAddressScreen(
                                isFromMapScreen: true,
                                onAddressSelected: (AddressModel model) {
                                  onPredictionTap(model);
                                  _appNavigator.pop();
                                },
                              ),
                            );
                          },
                          child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Palette.grey50, BlendMode.srcATop),
                              child: acoisViewModel.image),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.appCardColor,
                        ),
                      ),
                      const SizedBox(
                        width: Spacings.small,
                      ),
                    ],
                  );
                } else {
                  return InkWell(
                    key: QuickFilterWidget.getFilterCardKey(index),
                    onTap: () {
                      onQuickFilterTap(acoisViewModel.mode);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: Spacings.small),
                      child: AppCardWidget(
                        cornerRadius: Spacings.xxxLarge,
                        backgroundColor: currentStatus ?? true
                            ? Palette.primary
                            : Palette.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: Spacings.medium, right: Spacings.small),
                              child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      currentStatus ?? true
                                          ? Palette.white
                                          : Palette.grey50,
                                      BlendMode.srcATop),
                                  child: acoisViewModel.image),
                            ),
                            const SizedBox(
                              width: Spacings.medium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
