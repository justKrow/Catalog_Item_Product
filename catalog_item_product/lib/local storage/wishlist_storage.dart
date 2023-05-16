import 'dart:convert';

import 'package:catalog_item_product/module/home/model/product_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveWishlistItems(List<ProductDataModel> wishlistItems) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> wishlistJsonList =
      wishlistItems.map((item) => jsonEncode(item.toJson())).toList();
  await prefs.setStringList('wishlist', wishlistJsonList);
}

Future<List<ProductDataModel>> loadWishlistItems() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? wishlistJsonList = prefs.getStringList('wishlist');
  if (wishlistJsonList != null) {
    List<ProductDataModel> wishlistItems = wishlistJsonList
        .map((json) => ProductDataModel.fromJson(jsonDecode(json)))
        .toList();
    return wishlistItems;
  } else {
    return [];
  }
}
