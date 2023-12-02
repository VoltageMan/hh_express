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
    required this.initialIndex,
    required this.onChange,
  });
  final List<String> images;
  final int initialIndex;
  Function(int) onChange;
  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    controller = TabController(
      length: widget.images.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
    controller.addListener(() {
      widget.onChange(controller.index);
    });
    super.initState();
  }

  late final TabController controller;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqHeight = MediaQuery.sizeOf(context).height;
    final images = widget.images;
    return GestureDetector(
      onPanUpdate: (details) {
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
              child: TabBarView(
                controller: controller,
                children: List.generate(
                  controller.length,
                  (index) {
                    return PhotoView(
                      minScale: 0.0,
                      loadingBuilder: (context, event) =>
                          ProdDetailsImagePlaceHolder(),
                      backgroundDecoration: BoxDecoration(
                        color: context.theme.scaffoldBackgroundColor,
                      ),
                      imageProvider: CachedNetworkImageProvider(
                        images[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            ImageIndicator(controller: controller)
          ],
        ),
      ),
    );
  }
}
