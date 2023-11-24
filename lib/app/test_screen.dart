import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:hh_express/repositories/product_details/product_details_repository.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final repo = getIt<ProductDetailsRepo>();
  @override
  Widget build(BuildContext context) {
    LocalStorage.init();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return SimmilarVideoWidget();
            },
          )
        ],
      ),
    );
  }
}

class SimmilarVideoWidget extends StatelessWidget {
  const SimmilarVideoWidget({
    super.key,
    this.model,
  });
  final ProductModel? model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ((AppSpacing.getTextHeight(67)..log()) + 38.h)..log(),
      width: double.infinity,
      margin: AppPaddings.horiz_16.add(AppPaddings.vertic_12),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 115 / 139,
            child: ClipRRect(
              borderRadius: AppBorderRadiuses.border_6,
              child: CachedNetworkImage(
                // todo remove start with
                imageUrl: model?.image ?? AssetsPath.macBook,
                // todo error widget
                errorWidget: (context, url, error) {
                  return Center(
                    child: Icon(
                      Icons.image_outlined,
                      color: AppColors.darkBlue,
                    ),
                  );
                },
                fit: BoxFit.cover,
                placeholder: (context, url) => const MyShimerPlaceHolder(),
              ),
            ),
          ),
          AppSpacing.horizontal_15,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model?.description}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.displaySmall12(context),
                ),
                AppSpacing.vertical_12,
                Text(
                  '${model?.salePrice} TMT',
                  style: AppTheme.titleLargeW600(context),
                ),
                Text(
                  '${model?.price} TMT',
                  style: AppTheme.displaySmall12(context).copyWith(),
                ),
                AppSpacing.vertical_12,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: AppPaddings.right_6,
                      decoration: ShapeDecoration(
                        color: Color(0xFF0B1427),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      padding: AppPaddings.horiz10_vertic5,
                      child: Text(
                        context.l10n.buy,
                        maxLines: 1,
                        style: context.theme.textTheme.labelMedium,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0B1427),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: AppPaddings.horiz10_vertic5,
                        child: FittedBox(
                          child: Text(
                            context.l10n.addToCart,
                            maxLines: 1,
                            style: context.theme.textTheme.labelMedium,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
