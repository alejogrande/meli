import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:challenge_meli/ui/pages/search_list/bloc/search_list_bloc.dart';
import 'package:challenge_meli/ui/pages/search_list/gridview_items.dart';
import 'package:challenge_meli/ui/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListPage extends StatefulWidget {
  const SearchListPage({super.key});

  @override
  SearchListPageState createState() => SearchListPageState();
}

class SearchListPageState extends State<SearchListPage> {
  final FocusNode _searchFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    context.read<SearchListBloc>().add(LoadItemsEvent());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (items.length < limit) {
          context.read<SearchListBloc>().add(LoadItemsEvent(
              offset: items.length, name: _searchController.text));
        }
      }
    });
     _searchFocusNode.requestFocus();
  }

  List<Result?> items = [];
  int limit = 0;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          searchController: _searchController,
            focusNode: _searchFocusNode, // Asignar el FocusNode al appbar
            onChangedText:
              (value) {
                setState(() {
                  limit = 0;
                  items = [];
                });

                context
                    .read<SearchListBloc>()
                    .add(LoadSearchItemsEvent(name: value));},
                    
             
            enabled: true),
        body: Column(
          children: [
            
            BlocConsumer<SearchListBloc, SearchListState>(
              listener: (context, state) {
                if (state is SearchListHasData) {
                  items.addAll(state.data!.results as Iterable<Result?>);
                  limit = state.data!.paging!.total!;
                }
              },
              builder: (context, state) {
                return GridviewItems(
                    items: items, controller: _scrollController);
              },
            )
          ],
        ));
  }
}
