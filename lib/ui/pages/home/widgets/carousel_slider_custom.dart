import 'package:carousel_slider/carousel_slider.dart';
import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:challenge_meli/ui/widgets/card_product.dart';
import 'package:challenge_meli/utils/constans.dart';
import 'package:flutter/material.dart';

class CarouselSliderCustom extends StatelessWidget {
  final List<Result?>? items;
  final bool? autoPlay;

  const CarouselSliderCustom({
    super.key,
    this.items,
    this.autoPlay,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items
          ?.map(
            (e) => Padding(
              padding: const EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.productDetail,arguments: e);
                  },
                  child: CardProduct(
                      idImage: e!.id!,
                      title: e.title,
                      price: e.price!.toString(),
                      urlImage: e.thumbnail),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: autoPlay ?? true,
        viewportFraction: 0.4,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        initialPage: 1,
      ),
    );
  }
}
