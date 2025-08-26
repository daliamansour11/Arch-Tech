import 'package:archtech/core/theme/color_manger.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;
  final double? height, width;
  final BoxFit? fit;
  final bool showErrorIcon;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  const MyNetworkImage({
    super.key,
    required this.url,
    this.imageBuilder,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.showErrorIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      errorWidget: (context, url, error) {
        return Container(
          height: height ?? 200,
          width: width,
          color: const Color(0x7FE0E0E0),
          child: showErrorIcon
              ? const Center(
                  child: Icon(Icons.image_not_supported,
                      color: ColorManger.primary),
                )
              : const SizedBox.expand(),
        );
      },
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator.adaptive(
          value: progress.progress,
          valueColor: const AlwaysStoppedAnimation<Color>(ColorManger.primary),
        ),
      ),
      errorListener: (value) {
        debugPrint('Image load error: $value');
      },
      imageBuilder: imageBuilder,
    );
  }
}
