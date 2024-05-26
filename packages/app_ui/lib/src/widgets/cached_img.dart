import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Cached Network image
class CachedImg extends StatelessWidget {
  /// Cached Network image
  const CachedImg({
    required this.imageUrl,
    this.height,
    super.key,
  });

  /// url to the image
  final String imageUrl;

  /// height of the image (optional)
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
    );
  }
}
