import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/product_details/components/image_indicator.dart';
import 'package:hh_express/features/product_details/components/image_place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetails extends StatefulWidget {
  ImageDetails({
    super.key,
    required this.images,
    required this.initIndex,
  });
  final List<String> images;
  final int initIndex;

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  late final pageController = PageController(initialPage: widget.initIndex);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onPanUpdate: (details) {
        'sdfs'.log();
        if (details.delta.dy > 5) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: mqHeight * 0.7,
              child: PageView(
                controller: pageController,
                children: List.generate(
                  widget.images.length,
                  (index) {
                    return PhotoView(
                      minScale: 0.0,
                      enablePanAlways: true,
                      gestureDetectorBehavior: HitTestBehavior.translucent,
                      enableRotation: true,
                      loadingBuilder: (context, event) =>
                          ProdDetailsImagePlaceHolder(),
                      backgroundDecoration: BoxDecoration(
                        color: context.theme.scaffoldBackgroundColor,
                      ),
                      imageProvider: CachedNetworkImageProvider(
                        widget.images[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            70.verticalSpace,
            ImageIndicator(
              controller: pageController,
              total: widget.images.length,
            )
          ],
        ),
      ),
    );
  }
}
