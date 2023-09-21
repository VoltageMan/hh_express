import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/categories/bloc/category_bloc.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/models/categories/category_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class MainCategoriesWidget extends StatefulWidget {
  const MainCategoriesWidget({
    super.key,
    required this.isSelected,
    required this.model,
  });

  final CategoryModel? model;
  final bool isSelected;

  @override
  State<MainCategoriesWidget> createState() => _MainCategoriesWidgetState();
}

class _MainCategoriesWidgetState extends State<MainCategoriesWidget> {
  @override
  void initState() {
    bloc = context.read<CategoryBloc>();

    super.initState();
  }

  late CategoryBloc bloc;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    final isLoading = model == null;
    if (isLoading) {
      return _LoadingWidget();
    }
    return GestureDetector(
      onTap: () {
        final state = bloc.state;
        final itSelf = state.mains![state.activIndex!].slug == model.slug;
        if (itSelf) {
          return;
        }
        bloc.add(ChangeCategory(slug: model.slug));
      },
      child: Container(
        width: 76.w,
        padding: AppPaddings.horiz_10half,
        margin: AppPaddings.top_6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 55.sp,
              width: 55.sp,
              alignment: Alignment.center,
              padding: AppPaddings.all_2,
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 50.sp,
                width: 50.sp,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                padding: AppPaddings.vertic_6,
                child: Image.asset(
                  model.image,
                  fit: BoxFit.contain,
                ),
                alignment: Alignment.center,
              ),
            ),
            AppSpacing.vertical_10,
            Center(
              child: Text(
                '${model.name}',
                style: AppTheme.bodyMedium10(context),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            AppSpacing.vertical_4,
            if (widget.isSelected)
              Container(
                height: 3.h,
                width: 68.w,
                margin: AppPaddings.horiz_4,
                color: AppColors.black,
              )
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<int, int> map = {};

    return Container(
      width: 76.w,
      padding: AppPaddings.horiz_10half,
      margin: AppPaddings.top_6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55.sp,
            width: 55.sp,
            padding: AppPaddings.all_2,
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: MyShimerPlaceHolder(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.shimmerBodyColor,
                ),
              ),
            ),
          ),
          AppSpacing.vertical_10,
          SizedBox(
            height: 12,
            child: MyShimerPlaceHolder(
              radius: AppBorderRadiuses.border_2,
            ),
          ),
          AppSpacing.vertical_4,
        ],
      ),
    );
  }
}

//  CircleAvatar(
//                 backgroundColor: AppColors.transparent,
//                 foregroundColor: AppColors.transparent,
//                 foregroundImage: hasError
//                     ? AssetImage('assets/images/app_icon.png')
//                     : CachedNetworkImageProvider(
//                         model.image,
//                         errorListener: () {
//                           // set error image
//                           'Imageerror'.log();
//                           hasError = true;
//                           setState(() {});
//                         },
//                       ) as ImageProvider,
//                 child: MyShimerPlaceHolder(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.shimmerBodyColor,
//                     ),
//                   ),
//                 ),
//               ),
