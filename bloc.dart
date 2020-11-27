import 'package:bloc/bloc.dart';
import 'package:sejutacita/bloc/event.dart';
import 'package:sejutacita/bloc/state.dart';
import 'package:sejutacita/domain/search-domain.dart';
import 'package:sejutacita/model/Doraemon.dart';
import 'package:flutter/material.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  final SearchDomain searchDomain;


  SearchBloc({
    @required this.searchDomain
  });


  @override
  SearchState get initialState => SearchFetchLoading();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async*{
    if (event is SearchFetching){
      yield SearchFetchLoading();
      try {
        List<Items> items = await searchDomain.getItemsSearch();
//        Items items = await searchDomain.getItemsSearch();
        yield SearchFetchSuccess(items: items);
//        yield SearchFetchSuccess();
      }catch (e){
        yield SearchFetchError(error: e.toString());
      }
    }
  }
}
