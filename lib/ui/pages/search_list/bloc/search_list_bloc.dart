// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:challenge_meli/domain/use_cases/get_meli_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_list_event.dart';
part 'search_list_state.dart';

class SearchListBloc extends Bloc<SearchListEvent, SearchListState> {
  final GetMeliApi _getMeliApi;
  SearchListBloc(this._getMeliApi) : super(SearchListInitial()) {
    on<SearchListEvent>((event, emit) async {
      if (event is LoadItemsEvent) {
        emit(SearhListLoading());
        final response = await _getMeliApi.getItemsCategories(
            offset: event.offset, name: event.name);
        response.fold(
          (failure) {
            emit(SearchListError(failure.message));
          },
          (data) {
            emit(SearchListHasData(data: data));
          },
        );
      }
      if (event is LoadSearchItemsEvent) {
        emit(SearhListLoading());
        await _startSearchTimer(event.name);
      }
    });
  }

  Timer? _searchTimer;
  _startSearchTimer(String? name) async {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 500), () async {
      final response = await _getMeliApi.getItemsCategories(name: name);
      response.fold(
        (failure) {
          emit(SearchListError(failure.message));
        },
        (data) {
          emit(SearchListHasData(data: data));
        },
      );
    });
  }
}
