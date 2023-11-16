import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/features/components/widgets/svg_icons.dart';
import 'package:hh_express/features/search/cubit/search_cubit.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/settings/consts.dart';

class HomeSearchField extends StatefulWidget {
  const HomeSearchField({super.key});
  @override
  State<HomeSearchField> createState() => _HoemSearchFieldState();
}

class _HoemSearchFieldState extends State<HomeSearchField> {
  @override
  void initState() {
    controller.addListener(() {
      final text = controller.text;
      if (text.isEmpty || text == cubit.fieldVal) return;
      cubit.fieldVal = controller.text;
      cubit.search();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late final cubit = context.read<SearchCubit>();
  late final focus = FocusNode()..requestFocus();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;
    return Container(
      padding: AppPaddings.all_2,
      width: double.infinity,
      height: double.infinity,
      margin: AppPaddings.vertic_6,
      decoration: BoxDecoration(
        color: theme.fillColor,
        borderRadius: AppBorderRadiuses.border_6,
      ),
      child: TextField(
        controller: controller,
        maxLines: 1,
        scribbleEnabled: false,
        scrollPadding: EdgeInsets.zero,
        textInputAction: TextInputAction.search,
        focusNode: focus,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 0),
          hintText: context.l10n.searchHint,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 7.h,
            ),
            child: MyImageIcon(
              path: AssetsPath.searchIcon,
              iconSize: 20.8.h,
            ),
          ),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class HomeSearchFieldDummy extends StatelessWidget {
  const HomeSearchFieldDummy({super.key});

  @override
  Widget build(BuildContext context) {
    final inputTheme = context.theme.inputDecorationTheme;
    final l10n = context.l10n;

    return GestureDetector(
      onTap: () {
        'dsfdsfd'.log();
        context.push(AppRoutes.search);
      },
      child: Container(
        padding: AppPaddings.all_2,
        margin: AppPaddings.vertic_6,
        decoration: BoxDecoration(
          color: inputTheme.fillColor,
          borderRadius: AppBorderRadiuses.border_6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(7.h),
              child: MyImageIcon(
                path: AssetsPath.searchIcon,
                iconSize: 20.8.h,
              ),
            ),
            Text(
              l10n.searchHint,
              style: inputTheme.hintStyle,
            ),
          ],
        ),
      ),
    );
  }
}
