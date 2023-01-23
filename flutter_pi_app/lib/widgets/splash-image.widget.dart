import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage(
      {required this.imageAsset,
      required this.imageWidth,
      required this.imageHeight,
      super.key});

  final AssetImage imageAsset;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        imageAsset.assetName,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
