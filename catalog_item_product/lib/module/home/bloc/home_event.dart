part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HomeInitialEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddWishListIconClickedEvent extends HomeEvent {
  final ProductDataModel clickedProducts;

  AddWishListIconClickedEvent({required this.clickedProducts});

  @override
  List<Object?> get props => [clickedProducts];
}

class SearchBarNavigateEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
