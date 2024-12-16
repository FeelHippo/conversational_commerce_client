import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadtplan/injector.dart';
import 'package:stadtplan/presentation/dashboard_screen/widgets/dashboard_screen.dart';
import 'package:stadtplan/presentation/home_screen/bottom_navigation_controller.dart';
import 'package:stadtplan/presentation/home_screen/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/widgets/app_scaffold.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/utils/snackbar_mixin.dart';
import 'package:storage/main.dart';

part 'tab_switching_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.rootNavigatorKey,
    required this.userPreferences,
  });
  final GlobalKey<NavigatorState> rootNavigatorKey;
  final UserPreferences userPreferences;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin
    implements BottomNavigationController {
  int _currentPageIndex = 0;
  final List<NavigationPageView> _pages = <NavigationPageView>[];
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showBottomNavigation = true;
  bool isAppLoadFirstTime = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initPages();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// BottomNavigationController
  @override
  void hide() {
    if (_showBottomNavigation) {
      setState(() {
        _showBottomNavigation = false;
      });
    }
  }

  @override
  void show() {
    if (!_showBottomNavigation) {
      setState(() {
        _showBottomNavigation = true;
      });
    }
  }

  @override
  void showDashboard() {
    final int pageIndex = _findPageById(NavigationPage.map);
    if (pageIndex > -1) {
      setState(() {
        _currentPageIndex = pageIndex;
      });
    }
  }

  @override
  void showMore() {
    final int pageIndex = _findPageById(NavigationPage.settings);
    if (pageIndex > -1) {
      setState(() {
        _currentPageIndex = pageIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Palette.appCardColor,
      child: PopScope(
        child: SafeArea(
          top: false,
          child: Consumer<IOC>(
            builder: (BuildContext context, IOC ioc, Widget? child) {
              return AppScaffold(
                body: _buildBodyWidget(),
                bottomNavigationBar: _buildNavBar(),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Body Widget
  Widget _buildBodyWidget() {
    return Provider<BottomNavigationController>.value(
      value: this,
      child: Provider<AppNavigator>(
        create: (BuildContext context) => AppNavigator(
          widget.rootNavigatorKey,
          this,
          SnackBarHandler(context),
        ),
        child: _buildTransitionsStack(),
      ),
    );
  }

  Widget _buildTransitionsStack() {
    if (_pages.isNotEmpty) {
      return TabSwitchingView(
        currentTabIndex: _currentPageIndex,
        tabNumber: _pages.length,
        tabBuilder: (BuildContext context, int index) {
          return FadeTransition(
            opacity: _animation,
            child: _pages[index].builder(context),
          );
        },
      );
    }
    return const SizedBox();
  }

  /// Navigation Bar
  Widget _buildNavBar() {
    return Offstage(
      offstage: !_showBottomNavigation,
      child: BottomNavigation(
        items: _pages,
        selectedIndex: _currentPageIndex,
        onItemSelected: (int position) {
          _controller
            ..reset()
            ..forward();
          setState(() {
            _currentPageIndex = position;
          });
        },
      ),
    );
  }

  Widget _buildNavigationIcon(Image image) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 30,
      child: image,
    );
  }

  void _initPages() {
    _pages.clear();
    _pages
      ..add(
        NavigationPageView(
          NavigationPage.map,
          'Stadtplan',
          (_) => DashboardScreen(),
          _buildNavigationIcon(ImageAssets.icNavMap()),
          _buildNavigationIcon(ImageAssets.icNavMap(color: Palette.primary)),
        ),
      );
  }

  int _findPageById(NavigationPage id) {
    return _pages.indexWhere((NavigationPageView page) => page.id == id);
  }
}
