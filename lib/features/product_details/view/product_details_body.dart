import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/components/widgets/place_holder.dart';
import 'package:hh_express/features/home/bloc/home_bloc.dart';
import 'package:hh_express/features/home/view/components/product_widget.dart';
import 'package:hh_express/features/product_details/bloc/product_details_bloc.dart';
import 'package:hh_express/features/product_details/components/color_builder.dart';
import 'package:hh_express/features/product_details/components/delivery_widget/delivery_widget.dart';
import 'package:hh_express/features/product_details/components/image_indicator.dart';
import 'package:hh_express/features/product_details/components/image_place_holder.dart';
import 'package:hh_express/features/product_details/components/property_builder.dart';
import 'package:hh_express/features/product_details/view/image_details.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';
import 'package:hh_express/settings/theme.dart';

class ProdDetailsBody extends StatefulWidget {
  const ProdDetailsBody({super.key, required this.id});
  final int id;
  @override
  State<ProdDetailsBody> createState() => _ProdDetailsBodyState();
}

class _ProdDetailsBodyState extends State<ProdDetailsBody>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    bloc = context.read<ProductDetailsBloc>()..init(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    bloc.screenDispose();
    super.dispose();
  }

  late final ProductDetailsBloc bloc;
  void setTabController(int length) {
    if (tabController != null) return;
    tabController = TabController(
      length: length,
      vsync: this,
      animationDuration: AppDurations.duration_500ms,
    );
  }

  bool rebuilded = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final id = widget.id;
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      bloc: bloc,
      buildWhen: (previous, current) {
        final curId = bloc.currentProdId;
        return curId == id;
      },
      builder: (context, ss) {
        final state = bloc.state;
        if (state.state == ProdDetailsAPIState.init) return SizedBox();
        if (state.state == ProdDetailsAPIState.loading)
          return CenterLoading(
            onTap: () {
              state.log();
              bloc.state.log();

              bloc.currentProdId.log();
              id.log();
            },
          );
        final prodIndex = bloc.fingProdIndex(id);

        if (state.state == ProdDetailsAPIState.error || prodIndex == -1)
          return CategoryErrorBody(
            onTap: () {
              bloc.init(id);
            },
          );

        final product = state.products[prodIndex];
        final hasDiscount = product.discount != null;
        final l10n = context.l10n;
        setTabController(product.images.length);
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
                      children: product.images
                          .map(
                            (image) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageDetails(
                                      images: product.images,
                                      initialIndex: tabController!.index,
                                      onChange: (val) {
                                        tabController?.animateTo(val);
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl: image,
                                //! errorWidget
                                errorWidget: null,
                                placeholder: (context, url) =>
                                    ProdDetailsImagePlaceHolder(),
                                height: 300.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
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
                  '${product.name}',
                  style: textTheme.titleMedium,
                ),
              ),
              AppSpacing.vertical_4,
              Padding(
                padding: AppPaddings.horiz_16,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${AppPaddings.thousandsSeperator(product.salePrice)} TMT',
                      style: AppTheme.titleMedium16(context),
                    ),
                    AppSpacing.horizontal_8,
                    hasDiscount
                        ? Text(
                            '${AppPaddings.thousandsSeperator(product.discount!)} TMT',
                            style: AppTheme.lineThroughTitleSmall(context),
                            textAlign: TextAlign.start,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              ...product.properties.map(
                (e) {
                  if (e.name == 'colors') return const ProdColorBuilder();
                  return PropertyBuilder(model: e, id: id);
                },
              ).toList(),
              Padding(
                padding: AppPaddings.bottom12_top20.add(AppPaddings.horiz_16),
                child: Text(
                  l10n.description,
                  style: AppTheme.titleMedium14(context),
                ),
              ),
              Padding(
                padding: AppPaddings.horiz_16,
                child: Text(
                  '${product.description}',
                  style: textTheme.titleSmall,
                ),
              ),
              DeliveryWidget(),
              AppSpacing.vertical_26,
              Padding(
                padding: AppPaddings.top_20.add(AppPaddings.horiz_16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      l10n.similarProducts,
                      style: AppTheme.titleMedium14(context),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        l10n.more,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 320.h,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context.read<HomeBloc>().state.prods!.length,
                    itemBuilder: (context, index) {
                      return HomeProdWidget(
                        index: index == 0 ? -1 : -2,
                        prod: context.read<HomeBloc>().state.prods![index],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

final class CenterLoading extends StatelessWidget {
  const CenterLoading({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        GestureDetector(
          onTap: () {
            if (onTap != null) return onTap!();
          },
          child: CircularProgressIndicator(
            color: AppColors.appOrange,
          ),
        ),
      ],
    );
  }
}
