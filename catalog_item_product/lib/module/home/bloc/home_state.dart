// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

@immutable
abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingSuccessfulState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccessfulState({required this.products});

  @override
  List<Object?> get props => [products];
}

class HomeErrorState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeAddToWishListState extends HomeActionState {
  @override
  List<Object?> get props => [];
}
