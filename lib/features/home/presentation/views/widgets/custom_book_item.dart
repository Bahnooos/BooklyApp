import 'package:booklyapp/core/widgets/custom_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const CustomIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: imageUrl)),
        ),
      ),
    );
  }
}
