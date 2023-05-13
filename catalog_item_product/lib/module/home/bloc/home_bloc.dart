import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/product_data.dart';
import '../../../data/wish_list_tems.dart';
import '../model/product_data_model.dart';

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
    wishListItems.add(event.clickedProducts);
    emit(HomeAddToWishListState(!state.isClicked));
  }
}
