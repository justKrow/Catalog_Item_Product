part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchTypingState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {}
