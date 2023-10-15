import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/features/components/widgets/nav_bar_body.dart';
import 'package:hh_express/features/product_details/bloc/product_details_bloc.dart';
import 'package:hh_express/features/product_details/components/counter_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

class ProdDetailsBottomBar extends StatelessWidget {
  const ProdDetailsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state.state != ProdDetailsAPIState.succses)
          return Container(
            height: 72.h,
            color: Colors.transparent,
          );
        return NavBarBody(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyDarkTextButton(
                  title: l10n.buy,
                  onTap: () {
                    ModelBottomSheetHelper.showBuyProd();
                  },
                ),
              ),
              AppSpacing.horizontal_16,
              Expanded(
                child: CounterButton(
                  title: l10n.addToCart,
                  onAdd: (count) {
                    final messenger = ScaffoldMessenger.of(context);

                    if (LocalStorage.getToken == null) {
                      ThemeData(
                        snackBarTheme: SnackBarThemeData(
                          
                        )
                      );
                      final snack = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.black12,
                        margin: AppPaddings.all_12,
                        shape: RoundedRectangleBorder(
                            borderRadius: AppBorderRadiuses.border_50),
                        content: Text(
                          'un authorized',
                        ),
                        clipBehavior: Clip.hardEdge,
                        dismissDirection: DismissDirection.down,
                        padding: AppPaddings.all_24,
                      );
                      messenger.clearSnackBars();
                      messenger.showSnackBar(snack);
                      return false;
                    }

                    '$count add'.log();
                    return true;
                  },
                  onRemove: (count) {
                    '$count remm'.log();
                    return true;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
