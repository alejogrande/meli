part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadItemsCategory extends HomeEvent {
  String? category;
  int? offset;
  LoadItemsCategory({this.category, this.offset});
}
