import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/app/test_screen.dart';
import 'package:hh_express/features/address/addres_read_sheet.dart';
import 'package:hh_express/features/address/view/address_field.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/chat/bloc/chat_bloc.dart';
import 'package:hh_express/features/chat/bloc/chat_events.dart';
import 'package:hh_express/features/components/widgets/sheet_titles.dart';
import 'package:hh_express/features/favors/view/favors_body.dart';
import 'package:hh_express/features/filter/components/sheet_body.dart';
import 'package:hh_express/features/order_history/view/screens/orders_sheet_body.dart';
import 'package:hh_express/features/product_details/view/modalSheet/product_modal_body.dart';
import 'package:hh_express/features/product_details/view/product_details_body.dart';
import 'package:hh_express/features/profile/view/sheets/change_lang_sheet.dart';
import 'package:hh_express/features/video/cubit/simmilar_prods_cubit.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/helpers/widgets/sliver_pinnded_container.dart';
import 'package:hh_express/models/addres/address_model.dart';
import 'package:hh_express/models/cart/cart_order_model/cart_order_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';
import 'package:image_picker/image_picker.dart';

class ModelBottomSheetHelper {
  static bool _sheetShown = false;
  static BuildContext? _currentContext;

  /// this fuck pops ModalSheet if its shown and return value for WillPopScoup Widget
  static bool doPop() {
    if (_sheetShown) {
      Navigator.pop(_currentContext!);
      return false;
    }
    return true;
  }

  static Future<void> showFilterSheet() async {
    _sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      builder: (context) {
        _currentContext = context;
        return const FilterSheetBody();
      },
    );
    _sheetShown = false;
  }

  static Future<void> showLangSheet() async {
    _sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      builder: (context) {
        _currentContext = context;
        return const ChangeLangSheet();
      },
    );

    _sheetShown = false;
  }

  static Future<void> showBuyProd() async {
    _sheetShown = true;
    // await showModalBottomSheet(
    //   context: appRouter.currentContext,
    //   useRootNavigator: true,
    //   isScrollControlled: true,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    //   ),
    //   builder: (context) {
    //     _currentContext = context;
    //     return BuyProdSheetBody();
    //   },
    // );

    _sheetShown = false;
  }

  static Future<void> showOrderDetails(CartOrderModel model) async {
    _sheetShown = true;
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        _currentContext = context;
        return SizedBox(height: 700.h, child: BuyProdSheetBody(model: model));
      },
    );
    _sheetShown = false;
  }

  static Future<void> showProfileSheets(int index) async {
    List<Widget> _profileSheets = [
      SizedBox(),
      AddressReadSheet(),
      OrdersSheetBody(),
      FavorsBody(),
      ChangeLangSheet(),
    ];
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        _sheetShown = true;
        _currentContext = context;
        return _profileSheets[index];
      },
    );
    _sheetShown = false;
  }

  static Future<void> showAddressSelecSheet() async {
    final context = appRouter.currentContext;
    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        _sheetShown = true;
        _currentContext = context;
        return AddressReadSheet(forComplete: true);
      },
    );
    _sheetShown = false;
  }

  static Future<void> showAddressUpdateSheet(AddressModel? model) async {
    final context = appRouter.currentContext;
    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      builder: (context) {
        _sheetShown = true;
        _currentContext = context;
        return AddressField(
          model: model,
        );
      },
    );
    _sheetShown = false;
  }

  static Future<void> showCameraOrGallerySelector(BuildContext context) async {
    final bloc = BlocProvider.of<ChatBloc>(context);
    bool? isFromCamera;
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            10,
          ),
        ),
      ),
      context: context,
      builder: (ctx) {
        _sheetShown = true;
        return Container(
          padding: EdgeInsets.all(20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                padding: EdgeInsets.all(5.sp),
                child: IconButton(
                  onPressed: () async {
                    isFromCamera = true;
                    Navigator.of(ctx).pop();
                  },
                  icon: Icon(
                    Icons.camera_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
                child: VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                padding: EdgeInsets.all(5.sp),
                child: IconButton(
                  onPressed: () async {
                    isFromCamera = false;
                    Navigator.of(ctx).pop();
                  },
                  icon: Icon(
                    Icons.image_outlined,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    if (isFromCamera != null) {
      final image = await ImagePicker().pickImage(
        source: isFromCamera! ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50,
      );
      if (image != null) {
        bloc.add(
          SendMessageEvent(
            file: image,
          ),
        );
        if (appRouter.location != AppRoutes.chat) {
          context.push(AppRoutes.chat);
        }
      }
    }
  }

  static Future<void> showVideoSimmilarProds(BuildContext context) async {
    await showModalBottomSheet(
      context: appRouter.currentContext,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      builder: (ctx) {
        _sheetShown = true;
        _currentContext = ctx;
        return VideoSimmilarProdsSheet();
      },
    );
    _sheetShown = false;
  }
}

class VideoSimmilarProdsSheet extends StatefulWidget {
  const VideoSimmilarProdsSheet({super.key});
  @override
  State<VideoSimmilarProdsSheet> createState() =>
      _VideoSimmilarProdsSheetState();
}

class _VideoSimmilarProdsSheetState extends State<VideoSimmilarProdsSheet> {
  final scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              (scrollController.position.maxScrollExtent - 30.h) &&
          scrollController.position.isScrollingNotifier.value) {
        final state = cubit.state;
        if (state.state != ProductAPIState.success ||
            state.pagination!.currentPage == state.pagination!.lastPage) {
          return;
        }
        cubit.loadMore();
      }
    });
    super.initState();
  }

  late final cubit = context.read<SimmilarProdsCubit>();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadiuses.border_10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadiuses.border_10,
        ),
        height: MediaQuery.sizeOf(context).height - 92.h - AppSpacing.topPad,
        width: double.infinity,
        child: BlocBuilder<SimmilarProdsCubit, SimmilarProdsState>(
          bloc: cubit,
          builder: (context, state) {
            final apiState = state.state;
            if (apiState == ProductAPIState.init) return SizedBox();
            if (apiState == ProductAPIState.error) return CategoryErrorBody();
            if (apiState == ProductAPIState.loading) return CenterLoading();
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverPinndedContainer(
                    height: AppSpacing.getTextHeight(16 + 32.sp),
                    widget: Padding(
                      padding: AppPaddings.all_16,
                      child: BottomSheetTitle(
                        title:
                            '${context.l10n.all} (${state.pagination?.count ?? 0})',
                      ),
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: state.prods!.length,
                  itemBuilder: (context, index) => SimmilarVideoWidget(
                    model: state.prods![index],
                  ),
                ),
                if (apiState == ProductAPIState.loadingMoreError)
                  CategoryErrorBody(
                    onTap: () {
                      cubit.loadMore();
                    },
                  ).toSliverBox,
                if (apiState == ProductAPIState.loadingMore)
                  CenterLoading().toSliverBox
              ],
            );
          },
        ),
      ),
    );
  }
}




