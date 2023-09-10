import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/home/view/components/product_widget.dart';
import 'package:hh_express/features/productDetails/components/color_builder.dart';
import 'package:hh_express/features/productDetails/components/image_indicator.dart';
import 'package:hh_express/features/productDetails/components/sizes_builder.dart';
import 'package:hh_express/features/productDetails/view/image_details.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class ProdDetailsBody extends StatefulWidget {
  const ProdDetailsBody({super.key});

  @override
  State<ProdDetailsBody> createState() => _ProdDetailsBodyState();
}

class _ProdDetailsBodyState extends State<ProdDetailsBody>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 11, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return ListView.custom(
      shrinkWrap: true,
      childrenDelegate: SliverChildListDelegate(
        [
          SizedBox(
            height: 300.h,
            child: Stack(
              children: [
                TabBarView(
                  controller: tabController,
                  children: List.generate(
                    11,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageDetails(
                              controller: tabController!,
                            ),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        placeholder: (context, url) => MyShimerPlaceHolder(),
                        height: 300.h,
                        fit: BoxFit.cover,
                        imageUrl: AssetsPath.macBook,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ImageIndicator(controller: tabController!),
                )
              ],
            ),
          ),
          Padding(
            padding: AppPaddings.horiz16_vertic12,
            child: Text(
              'Oglanlar üçin uzyn ýaşyl köýnek',
              style: textTheme.titleMedium,
            ),
          ),
          AppSpacing.vertical_4,
          Padding(
            padding: AppPaddings.horiz_16,
            child: Wrap(
              children: [
                Text(
                  '550 TMT',
                  style: AppTheme.titleMedium16(context),
                ),
                AppSpacing.horizontal_8,
                Text(
                  '700Tmt',
                  style: AppTheme.lineThroughTitleSmall(context),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppPaddings.bottom12_top20.add(AppPaddings.horiz_16),
            child: Text(
              'Ölceg Saýlan',
              style: AppTheme.titleMedium14(context),
            ),
          ),
          const ProdSizesBuilder(),
          AppSpacing.vertical_10,
          Padding(
            padding: AppPaddings.bottom12_top20.add(AppPaddings.horiz_16),
            child: Text(
              'Reňk saýlaň',
              style: AppTheme.titleMedium14(context),
            ),
          ),
          const ProdColorBuilder(),
          // add Color Builder
          Padding(
            padding: AppPaddings.bottom12_top20.add(AppPaddings.horiz_16),
            child: Text(
              'Mazmuny',
              style: AppTheme.titleMedium14(context),
            ),
          ),
          Padding(
            padding: AppPaddings.horiz_16,
            child: Text(
              'Bu gaty gowy köýnek, marka öz harytlaryna garantiýa berýär we bu köýnegiň reňki ýaşyl',
              style: textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: AppPaddings.top_20.add(AppPaddings.horiz_16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Menzeyanler',
                  style: AppTheme.titleMedium14(context),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Ginisleyin',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300.h,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return HomeProdWidget(
                    index: index == 0 ? -1 : -2,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
