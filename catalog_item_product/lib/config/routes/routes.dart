import 'package:catalog_item_product/module/home/bloc/home_bloc.dart';
import 'package:catalog_item_product/module/home/home_screen.dart';
import 'package:catalog_item_product/module/home/ui/home_page.dart';
import 'package:catalog_item_product/module/wishlist/fav_page.dart';
import 'package:catalog_item_product/module/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      case "/WishListPage":
        return makeRoute(
          const WishListPage(),
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
