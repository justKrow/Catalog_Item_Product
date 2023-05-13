import 'package:catalog_item_product/utils/color_constant.dart';
import 'package:flutter/material.dart';

class ProfileSettingOptions extends StatelessWidget {
  final IconData icon;
  final String name;
  final IconData trailicon;
  const ProfileSettingOptions({
    super.key,
    required this.icon,
    required this.name,
    required this.trailicon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: AppColor.appBlack,
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(
        trailicon,
        size: 20,
      ),
    );
  }
}
