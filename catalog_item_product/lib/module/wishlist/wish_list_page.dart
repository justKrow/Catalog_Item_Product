import 'package:catalog_item_product/data/wish_list_data.dart';
import 'package:catalog_item_product/module/home/bloc/home_bloc.dart';
import 'package:catalog_item_product/module/home/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        return Scaffold(
          body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            shrinkWrap: true,
            children: wishListItems.map((data) {
              return ProductCard(
                productDataModel: data,
                homeBloc: HomeBloc(),
              );
            }).toList(),
          ),
        );
      },
    ));
  }
}
