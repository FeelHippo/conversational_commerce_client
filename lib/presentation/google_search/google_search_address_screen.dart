import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apiClient/main.dart';
import 'package:stadtplan/injector.dart';
import 'package:stadtplan/presentation/google_search/bloc/bloc.dart';
import 'package:stadtplan/presentation/google_search/widget/google_search_address_widget.dart';
import 'package:stadtplan/presentation/widgets/app_scaffold.dart';

class GoogleSearchAddressScreen extends StatelessWidget {
  const GoogleSearchAddressScreen({
    super.key,
    required this.onAddressSelected,
    required this.checkZipCode,
    this.address,
    required this.isFromMapScreen,
  });

  final ValueChanged<AddressModel> onAddressSelected;
  final bool checkZipCode;
  final String? address;
  final bool isFromMapScreen;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Consumer<IOC>(
        builder: (BuildContext context, IOC ioc, Widget? child) {
          final GoogleSearchBloc googlePlacesBloc =
          ioc.getDependency<GoogleSearchBloc>();
          return GoogleSearchAddressWidget(
              bloc: googlePlacesBloc,
              onAddressSelected: onAddressSelected,
              checkZipCode: checkZipCode,
              address: address,
              isFromMapScreen: isFromMapScreen
          );
        },
      ),
    );
  }
}
