import 'package:flutter/material.dart';
import '../../module/home/bloc/home_bloc.dart';
import '../../module/home/ui/home_page1.dart';
import '../../module/home/home_screen.dart';
import '../../module/pages/fav_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../module/pages/profile_page.dart';

class Routes {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return makeRoute(
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc()..add(HomeInitialEvent()),
            child: const HomeScreen(),
          ),
          settings,
        );
      case "/homePage":
        return makeRoute(
          BlocProvider(
            create: (context) => HomeBloc(),
            child: const HomePage(),
          ),
          settings,
        );
      case "/favPage":
        return makeRoute(
          const FavPage(),
          settings,
        );
      case "/profilePage":
        return makeRoute(
          const ProfilePage(),
          settings,
        );
      default:
    }
    return null;
  }
}

Route? makeRoute(Widget widget, RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      return widget;
    },
    settings: settings,
  );
}
