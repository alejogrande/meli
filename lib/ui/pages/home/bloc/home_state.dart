part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

class ItemsCategoryLoading extends HomeState {}

class ItemsCategoryError extends HomeState {
  String? message;
  ItemsCategoryError(this.message);
}

class ItemsCategoryEmpty extends HomeState {}

class ItemsCategoryHasData extends HomeState {
  ItemsCategoryEntity? data1;
  ItemsCategoryEntity? data2;
  ItemsCategoryEntity? data3;

  ItemsCategoryHasData({this.data1,this.data2,this.data3});
}
