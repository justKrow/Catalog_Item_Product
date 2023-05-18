part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchInitialEvent extends SearchEvent {}

class SearchTypingEvent extends SearchEvent {
  final String query;

  SearchTypingEvent({required this.query});
}

class SearchClickedEvent extends SearchEvent {}
