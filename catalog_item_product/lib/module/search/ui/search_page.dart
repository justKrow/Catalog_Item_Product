import 'package:catalog_item_product/config/routes/context_ext.dart';
import 'package:catalog_item_product/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(color: AppColor.appBlack, fontSize: 24),
        ),
        backgroundColor: AppColor.mainColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: Icon(
              FontAwesomeIcons.arrowLeftLong,
              color: AppColor.appBlack,
              size: 20,
            )),
      ),
      body: Container(),
    ));
  }
}
