import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/address/cubit/address_cubit.dart';
import 'package:hh_express/features/auth/components/auth_field.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/features/components/widgets/sheet_titles.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/models/addres/address_model.dart';
import 'package:hh_express/settings/consts.dart';

class AddressField extends StatefulWidget {
  const AddressField({super.key, required this.model});
  final AddressModel? model;
  @override
  State<AddressField> createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  late final controller = TextEditingController(text: widget.model?.address);
  late final cubit = context.read<AddressCubit>();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return KeyboardSizeProvider(
      smallSize: 400,
      child: Column(
        children: [
          BottomSheetTitle(
            title: l10n.address,
            isPadded: true,
          ),
          AppSpacing.vertical_40,
          AuthField(
            keyboardType: TextInputType.text,
            label: l10n.address,
            controller: controller,
          ),
          Padding(
            padding: AppPaddings.horiz_16.copyWith(bottom: 16.h, top: 10.h),
            child: MyDarkTextButton(
              title: l10n.save,
              onTap: () async {
                final model = widget.model;
                if (model == null) {
                  final data = await cubit.create(controller.text);
                } else {
                  final data =
                      await cubit.update(model.update(controller.text));
                }
                Navigator.pop(context);
              },
            ),
          ),
          Consumer<ScreenHeight>(
            builder: (context, value, child) {
              return SizedBox(
                height: value.keyboardHeight,
              );
            },
          ),
        ],
      ),
    ).toSingleChildScrollView;
  }
}
