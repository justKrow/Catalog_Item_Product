// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

@immutable
abstract class HomeActionState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessfulState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccessfulState({required this.products});
}

class HomeProductDetailState extends HomeState {}

class HomeAddFavState extends HomeActionState {}

class HomeErrorState extends HomeState {}
