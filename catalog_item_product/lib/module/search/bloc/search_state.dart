part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchTypingState extends SearchState {
  final String query;

  SearchTypingState({required this.query});
}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {}
