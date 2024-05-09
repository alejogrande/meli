import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RoundedImage extends StatelessWidget {
  final String? imageUrl;
  final double borderRadius;

  const RoundedImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = 8.0, // Valor predeterminado del radio de borde
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
      ),
    );
  }
}
