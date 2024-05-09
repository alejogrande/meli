
import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:challenge_meli/ui/widgets/card_product.dart';
import 'package:challenge_meli/utils/constans.dart';
import 'package:flutter/material.dart';


class GridviewItems extends StatelessWidget {
  final List<Result?>? items;
  final ScrollController controller;
  const GridviewItems({
    this.items,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Scrollbar(
          thumbVisibility: true,
          controller: controller,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2, // Number of columns in the grid
            // crossAxisSpacing: 10, // Spacing between the columns
            // mainAxisSpacing: 10, // Spacing between the rows
            childAspectRatio: 2 / 2.8,
            controller: controller,
            children: items!
                .map((e) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.productDetail,
                              arguments: e);
                        },
                        child: CardProduct(idImage:e!.thumbnailId!,price:e.price.toString(),title: e.title,urlImage: e.thumbnail,)
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
