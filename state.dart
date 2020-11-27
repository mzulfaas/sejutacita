import 'package:equatable/equatable.dart';
import 'package:sejutacita/model/Doraemon.dart';

abstract class SearchState extends Equatable{
  const SearchState();
}

class SearchFetchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchFetchSuccess extends SearchState {
  final List<Items> items;
//  final Items items;

  const SearchFetchSuccess({this.items});

  @override
  List<Object> get props => [items];
}

class SearchFetchError extends SearchState {
  final String error;

  const SearchFetchError({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SearchFailure { error: $error }';
}