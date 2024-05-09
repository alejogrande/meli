
import 'package:challenge_meli/ui/widgets/rounded_image.dart';
import 'package:challenge_meli/utils/utils.dart';
import 'package:flutter/material.dart';


class CardProduct extends StatelessWidget {
  final String? title;
  final String? price;
  final String? urlImage;
  final String idImage;
   const CardProduct({
    required this.idImage,
    this.price,
    this.title,
    this.urlImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AspectRatio(
            aspectRatio: 16 / 13,
            child: Hero(
              tag: 
              idImage,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: RoundedImage(imageUrl: urlImage),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              Utils.formatPrice(
                  double.parse(price!)),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
