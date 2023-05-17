// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

@immutable
abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessfulState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccessfulState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeAddToWishListState extends HomeActionState {}

class WishListReloadState extends HomeState {}

class WishListReloadedState extends HomeState {}
