import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class JdNetworkImage extends StatelessWidget {
  final String url;
  final Widget? errorChild;
  const JdNetworkImage({
    super.key,
    required this.url,
    this.errorChild,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: url,
      progressIndicatorBuilder: (context, url, download) {
        return Center(
          child: CircularProgressIndicator(value: download.progress),
        );
      },
      errorWidget: (context, url, error) {
        // print(error);
        return errorChild ??
            Container(
              alignment: Alignment.center,
              color: Colors.black12,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Something went wrong',
                textAlign: TextAlign.center,
              ),
            );
      },
    );
  }

  // Widget _buildImage() {
  //   return Image.network(
  //     url,
  //     fit: BoxFit.cover,
  //     loadingBuilder: (
  //       BuildContext context,
  //       Widget child,
  //       ImageChunkEvent? loadingProgress,
  //     ) {
  //       if (loadingProgress == null) return onReady(child);
  //       return onLoading(loadingProgress);
  //     },
  //     frameBuilder: (
  //       BuildContext context,
  //       Widget child,
  //       int? frame,
  //       bool wasSynchronouslyLoaded,
  //     ) {
  //       if (wasSynchronouslyLoaded) return onReady(child);
  //       return AnimatedOpacity(
  //         opacity: frame == null ? 0 : 1,
  //         duration: const Duration(seconds: 1),
  //         curve: Curves.easeOut,
  //         child: onReady(child),
  //       );
  //     },
  //   );
  // }
}
