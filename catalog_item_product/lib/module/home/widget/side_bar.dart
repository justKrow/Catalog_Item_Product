import 'package:catalog_item_product/config/routes/context_ext.dart';
import 'package:catalog_item_product/config/routes/routes.dart';
import 'package:catalog_item_product/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.xmark,
                    size: 20,
                  ))
            ],
          ),
          TextButton(
              onPressed: () {
                context.toName(Routes.homeScreenRoute);
              },
              child: Text(
                'Home',
                style: TextStyle(fontSize: 24, color: AppColor.appBlack),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'Privacy & Policy',
                style: TextStyle(fontSize: 24, color: AppColor.appBlack),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 24, color: AppColor.appBlack),
              )),
        ],
      ),
    ));
  }
}
