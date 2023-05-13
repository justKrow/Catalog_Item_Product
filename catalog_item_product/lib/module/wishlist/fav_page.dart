import 'package:catalog_item_product/data/wish_list_tems.dart';
import 'package:catalog_item_product/widget/product_card.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        shrinkWrap: true,
        children: wishListItems.map((data) {
          return ProductCard(
            productDataModel: data,
          );
        }).toList(),
      ),
    ));
  }
}
