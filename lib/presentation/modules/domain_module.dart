import 'package:injector/injector.dart';
import 'package:apiClient/main.dart';

class DomainModule {
  static PositionInteractor createPositionInteractor(Injector injector) =>
      PositionInteractor();

  static POIsInteractor createPOIsInteractor(Injector injector) =>
      POIsInteractor(injector.get<POIsProvider>());

  static GoogleSearchInteractor createGooglePlaceInteractor(
      Injector injector,
      ) =>
      GoogleSearchInteractor(
         googleSearchProvider: injector.get<GoogleSearchProvider>(),
      );
}
