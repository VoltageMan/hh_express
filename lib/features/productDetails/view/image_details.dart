import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/productDetails/components/image_indicator.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:photo_view/photo_view.dart';
import 'package:hh_express/settings/consts.dart';

class ImageDetails extends StatefulWidget {
  const ImageDetails({super.key, required this.controller});
  final TabController controller;

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    controller = TabController(
      length: widget.controller.length,
      vsync: this,
      initialIndex: widget.controller.index,
    );
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
    return Scaffold(
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
                        const MyShimerPlaceHolder(),
                    backgroundDecoration: BoxDecoration(
                      color: context.theme.scaffoldBackgroundColor,
                    ),
                    imageProvider: CachedNetworkImageProvider(
                      index % 2 == 0
                          ? 'https://images.unsplash.com/photo-1495573925654-ebcb91667e78?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'
                          : AssetsPath.exampleImage2,
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
    );
  }
}
