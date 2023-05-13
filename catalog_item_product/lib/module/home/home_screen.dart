import 'package:catalog_item_product/module/home/ui/home_page.dart';
import 'package:catalog_item_product/module/wishlist/fav_page.dart';
import 'package:catalog_item_product/module/profile/profile_page.dart';
import 'package:catalog_item_product/utils/color_constant.dart';
import 'package:catalog_item_product/module/home/widget/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List screen = [
    const HomePage(),
    const WishListPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const SideBar(),
      appBar: (pageIndex == 0)
          ? AppBar(
              iconTheme: IconThemeData(color: AppColor.appBlack),
              elevation: 0,
              backgroundColor: AppColor.mainColor,
              centerTitle: true,
              title: const CircleAvatar(
                backgroundImage: AssetImage('images/logo.png'),
              ),
              actions: [
                IconButton(
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.magnifyingGlass))
              ],
            )
          : (pageIndex == 1)
              ? AppBar(
                  iconTheme: IconThemeData(color: AppColor.appBlack),
                  elevation: 0,
                  backgroundColor: AppColor.mainColor,
                  centerTitle: true,
                  title: Text(
                    'Wishlist',
                    style: TextStyle(color: AppColor.appBlack),
                  ),
                )
              : null,
      body: screen[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() => pageIndex = value);
        },
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.black,
      ),
    ));
  }
}
