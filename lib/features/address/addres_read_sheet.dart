import 'package:flutter/material.dart';
import 'package:hh_express/features/address/view/address_sheet_body.dart';
import 'package:hh_express/features/address/view/address_sheet_title.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class AddressReadSheet extends StatelessWidget {
  const AddressReadSheet({
    super.key,
    this.forComplete = false,
  });
  final bool forComplete;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddressSheetTitle(),
        AppSpacing.vertical_16,
        AddressSheetBody(forComplite: forComplete),
        forComplete
            ? Padding(
                padding: AppPaddings.horiz16_vertic12,
                child: MyDarkTextButton(
                  title: context.l10n.next,
                  onTap: () {},
                ),
              )
            : AppSpacing.vertical_12
      ],
    ).toSingleChildScrollView;
  }
}
