import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:catalog_item_product/data/product_list_data.dart';
import 'package:catalog_item_product/data/search_data.dart';
import 'package:catalog_item_product/module/home/model/product_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    on<SearchEvent>((event, emit) {});
    on<SearchInitialEvent>(onSearchInitialEvent);
    on<SearchTypingEvent>(onSearchTypingEvent);
    on<SearchClickedEvent>(onSearchClickedEvent);
  }

  FutureOr<void> onSearchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) {
    emit(SearchInitialState());
  }

  FutureOr<void> onSearchTypingEvent(
      SearchTypingEvent event, Emitter<SearchState> emit) {
    searchList = _searchList(productList, event.query);
    emit(SearchTypingState(query: event.query));
  }

  FutureOr<void> onSearchClickedEvent(
      SearchClickedEvent event, Emitter<SearchState> emit) {
    emit(SearchLoadedState());
  }
}

List<ProductDataModel> _searchList(
    List<ProductDataModel> productList, String query) {
  return productList
      .where((item) =>
          item.productName!.toLowerCase().contains(query.toLowerCase()) ||
          item.brandTitle!.toLowerCase().contains(query.toLowerCase()))
      .toList();
}
