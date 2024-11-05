import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/dashboard_screen/pois_bloc/pois_bloc.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:apiClient/main.dart';

class ListConstants {

  static Map<QuickFilters, bool> quickFilterStatus = <QuickFilters, bool>{
    QuickFilters.favorite: false,
  };

  static List<AcoisModel> getQuickFilterAcois(BuildContext context) {
    final List<AcoisModel> listQuickFilter = <AcoisModel>[
      AcoisModel(
          mode: QuickFilters.search.name,
          image: ImageAssets.icSearch(),
      ),
      AcoisModel(
          mode: QuickFilters.favorite.name,
          image: ImageAssets.icStar(),
      ),
    ];
    return listQuickFilter;
  }

}