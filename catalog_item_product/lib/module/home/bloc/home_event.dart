part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class AddWishListIconClickedEvent extends HomeEvent {
  final ProductDataModel clickedProducts;

  AddWishListIconClickedEvent({required this.clickedProducts});
}
