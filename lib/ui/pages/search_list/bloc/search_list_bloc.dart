import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_list_event.dart';
part 'search_list_state.dart';

class SearchListBloc extends Bloc<SearchListEvent, SearchListState> {
  SearchListBloc() : super(SearchListInitial()) {
    on<SearchListEvent>((event, emit) {
    });
  }
}
