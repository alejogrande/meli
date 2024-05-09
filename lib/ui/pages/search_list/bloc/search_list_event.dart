part of 'search_list_bloc.dart';


sealed class SearchListEvent {}
class LoadItemsEvent extends SearchListEvent {
  String? name;
  int? offset;
  LoadItemsEvent({this.name,this.offset});
}

class LoadSearchItemsEvent extends SearchListEvent {
  String? name;
  LoadSearchItemsEvent({this.name});
}

