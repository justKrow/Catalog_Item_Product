import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:catalog_item_product/data/product_data.dart';
import 'package:catalog_item_product/data/wish_list_data.dart';
import 'package:catalog_item_product/module/home/model/product_data_model.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(onHomeInitialEvent);
    on<AddWishListIconClickedEvent>(onAddWishListIconClickedEvent);
  }

  FutureOr<void> onHomeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    List<ProductDataModel> productList = [];
    await Future.delayed(const Duration(seconds: 1));
    try {
      var datas = jsonDecode(ProductData().products);
      for (var data in datas) {
        productList.add(ProductDataModel.fromJson(data));
      }

      emit(HomeLoadingSuccessfulState(products: productList));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  FutureOr<void> onAddWishListIconClickedEvent(
      AddWishListIconClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeAddToWishListState());
    final productID = event.clickedProducts;
    if (wishListItems.contains(productID)) {
      wishListItems.remove(productID);
    } else {
      wishListItems.add(event.clickedProducts);
    }
  }
}
