import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/components/widgets/sheet_titles.dart';
import 'package:hh_express/features/orders/components/dashed_line.dart';
import 'package:hh_express/features/orders/components/order_info_list_tile.dart';
import 'package:hh_express/features/productDetails/components/image_indicator.dart';
import 'package:hh_express/features/productDetails/view/modalSheet/bottom_bar.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class BuyProdSheetBody extends StatefulWidget {
  const BuyProdSheetBody({super.key});
  @override
  State<BuyProdSheetBody> createState() => _BuyProdSheetBodyState();
}

class _BuyProdSheetBodyState extends State<BuyProdSheetBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700.h,
      child: Column(
        children: [
          BottomSheetTitle(
            title: context.l10n.buy,
            isPadded: true,
          ),
          AppSpacing.vertical_10,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 260.h,
                    margin: AppPaddings.horiz_16,
                    child: ClipRRect(
                      borderRadius: AppBorderRadiuses.border_6,
                      child: TabBarView(
                        controller: tabController,
                        children: List.generate(
                          tabController.length,
                          (index) {
                            return CachedNetworkImage(
                              placeholder: (context, url) =>
                                  const MyShimerPlaceHolder(),
                              height: 260.h,
                              fit: BoxFit.cover,
                              imageUrl: index % 2 == 0
                                  ? AssetsPath.exampleImage1
                                  : AssetsPath.exampleImage2,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  ImageIndicator(
                    controller: tabController,
                  ),
                  const _ProdBuyInfo()
                ],
              ),
            ),
          ),
          const BuyProdBottomBar(),
        ],
      ),
    );
  }
}

class _ProdBuyInfo extends StatelessWidget {
  const _ProdBuyInfo();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final titles = [
      l10n.prodName,
      l10n.color,
      l10n.size,
      l10n.products,
      l10n.delivery,
      l10n.perKilogram,
      l10n.totalPrice,
    ];
    return Container(
      margin: AppPaddings.all_16.copyWith(top: 0),
      padding: AppPaddings.horiz16_vertic12,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadiuses.border_6,
        border: Border.all(
          color: AppColors.lightGrey,
          width: 1.5.sp,
        ),
      ),
      alignment: Alignment.topRight,
      child: Column(
        children: [
          for (int i = 0; i < 3; i++)
            OrderInfoListTile(
              title: titles[i],
              content: 'Some sdg  fdg dfg fd gf gf  df h gfh fg',
            ),
          const DashedLine(isLoading: false),
          for (int i = 3; i < 6; i++)
            OrderInfoListTile(
              title: titles[i],
              content: 'Some',
            ),
          const DashedLine(isLoading: false),
          OrderInfoListTile(
            title: titles.last,
            content: '643 TMT',
            contentBold: true,
            titleBold: true,
          )
        ],
      ),
    );
  }
}
