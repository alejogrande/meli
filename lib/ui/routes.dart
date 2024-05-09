import 'package:challenge_meli/ui/pages/home/home_page.dart';
import 'package:challenge_meli/ui/pages/product_detail/product_detail_page.dart';
import 'package:challenge_meli/ui/pages/search_list/search_list_page.dart';
import 'package:challenge_meli/utils/constans.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.home: (_) => const HomePage(),
  Routes.productDetail: (_) => const ProductDetailPage(product: null,),
  Routes.searchList: (_) => const SearchListPage(),
};
