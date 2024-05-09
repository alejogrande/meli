part of 'search_list_bloc.dart';

sealed class SearchListState {}

final class SearchListInitial extends SearchListState {}


class SearhListLoading extends SearchListState {}

class SearchListError extends SearchListState {
  String? message;
  SearchListError(this.message);
}

class SeachListEmpty extends SearchListState {}

class SearchListHasData extends SearchListState {
  ItemsCategoryEntity? data;
  SearchListHasData({this.data});
}