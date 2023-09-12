import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/categories/view/body.dart';
import 'package:hh_express/features/home/bloc/home_bloc.dart';
import 'package:hh_express/features/home/view/components/product_builder.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    bloc = context.read<HomeBloc>()..init();
    scrollController = ScrollController(
      initialScrollOffset: bloc.lastPosition,
    );
    scrollController.addListener(() {
      bloc.lastPosition = scrollController.position.pixels;
      if (scrollController.position.pixels >=
              (scrollController.position.maxScrollExtent - 15.h) &&
          scrollController.position.isScrollingNotifier.value) {
        final state = bloc.state;
        if (state.state != ProductAPIState.succses ||
            state.pagination!.currentPage == state.pagination!.lastPage) {
          return;
        }
        bloc.loadMore();
      }
    });
    super.initState();
  }

  late final HomeBloc bloc;
  late final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.state == ProductAPIState.error) {
          return CategoryErrorBody(
            onTap: () {
              bloc.init();
            },
          );
        }
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            HomeProdBuilder(
              prods: state.prods,
            ),
            (state.state == ProductAPIState.loadingMoreError
                    ? CategoryErrorBody(
                        onTap: () {
                          bloc.loadMore();
                        },
                      )
                    : state.pagination?.currentPage !=
                            state.pagination?.lastPage
                        ? Container(
                            padding: AppPaddings.vertic_12,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: AppColors.appOrange,
                            ),
                          )
                        : SizedBox())
                .toSliverBox
          ],
        );
      },
    );
  }
}
