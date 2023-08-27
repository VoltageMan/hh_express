import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/categories/category_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class SimpleCategoryWidget extends StatelessWidget {
  const SimpleCategoryWidget({
    super.key,
    this.model,
  });
  final CategoryModel? model;
  @override
  Widget build(BuildContext context) {
    final isLoading = model == null;
    return GestureDetector(
      onTap: () {
        appRouter.currentContext.push(AppRoutes.categoryDetails);
      },
      child: Container(
        margin: AppPaddings.horiz_4,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: AppBorderRadiuses.border_6,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: AppBorderRadiuses.top_6,
              child: SizedBox(
                width: double.infinity,
                height: 65.h,
                child: isLoading
                    ? const MyShimerPlaceHolder()
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: model!.image,
                        placeholder: (context, url) =>
                            const MyShimerPlaceHolder(),
                        errorWidget: (context, url, error) =>
                            const MyShimerPlaceHolder(),
                      ),
              ),
            ),
            Container(
              padding: isLoading ? AppPaddings.all_6 : AppPaddings.all_4,
              alignment: Alignment.center,
              child: isLoading
                  ? MyShimerPlaceHolder(
                      radius: AppBorderRadiuses.border_2,
                    )
                  : Text(
                      model!.name,
                      style: AppTheme.bodyMedium10(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
