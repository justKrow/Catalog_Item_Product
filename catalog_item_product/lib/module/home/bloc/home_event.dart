part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class AddFavIconClickedEvent extends HomeEvent {
  final ProductDataModel clickedProducts;

  AddFavIconClickedEvent({required this.clickedProducts});
}

class ProductDetailsViewClickedEvent extends HomeEvent {}
