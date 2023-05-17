import 'package:catalog_item_product/module/home/bloc/home_bloc.dart';
import 'package:catalog_item_product/module/home/home_screen.dart';
import 'package:catalog_item_product/module/home/ui/home_page.dart';
import 'package:catalog_item_product/module/search/ui/search_page.dart';
import 'package:catalog_item_product/module/wishlist/wish_list_page.dart';
import 'package:catalog_item_product/module/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const homeScreenRoute = '/';
  static const homePageRoute = '/homePage';
  static const wishListPageRoute = "/WishListPage";
  static const profilePageRoute = "/profilePage";
  static const searchPageRoute = "/searchPage";
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
        return makeRoute(
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
            child: const HomeScreen(),
          ),
          settings,
        );
      case homePageRoute:
        return makeRoute(
          const HomePage(),
          settings,
        );
      case wishListPageRoute:
        return makeRoute(
          const WishListPage(),
          settings,
        );
      case profilePageRoute:
        return makeRoute(
          const ProfilePage(),
          settings,
        );
      case searchPageRoute:
        return makeRoute(
          const SearchPage(),
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
