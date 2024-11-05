import 'package:injector/injector.dart';
import 'package:apiClient/main.dart';
import 'package:stadtplan/presentation/dashboard_screen/pois_bloc/pois_bloc.dart';
import 'package:stadtplan/presentation/google_search/bloc/bloc.dart';
import 'package:stadtplan/presentation/splash/bloc/splash_bloc.dart';

class BlocModule {

  static SplashBloc createSplashBloc(Injector injector) {
    return SplashBloc();
  }

  static POIsBloc createPOIsBloc(Injector injector) => POIsBloc(
        injector.get<POIsInteractor>(),
      );

  static GoogleSearchBloc createGooglePlacesBloc(Injector injector) =>
      GoogleSearchBloc(
        googlePlaceInteractor: injector.get<GoogleSearchInteractor>(),
      );
}
