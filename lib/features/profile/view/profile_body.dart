import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/features/profile/components/profile_list_tile.dart';
import 'package:hh_express/helpers/confirm_exit.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/modal_sheets.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/globals.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final List<String> icons = [
    AssetsPath.navBarIcons[4],
    AssetsPath.phoneIcon,
    AssetsPath.ordersIcon,
    AssetsPath.favorFilled,
    AssetsPath.locationIcon,
    AssetsPath.langIcon,
    AssetsPath.locationIcon,
  ];
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      context.l10n.userName,
      context.l10n.phoneNumber,
      context.l10n.myOrders,
      context.l10n.favorites,
      context.l10n.welayat,
      context.l10n.programLang,
      context.l10n.address,
    ];
    final l10n = context.l10n;
    final langs = {
      'tr': l10n.turkmen,
      'ru': l10n.russian,
      'en': l10n.english,
    };
    return Column(
      children: [
        AppSpacing.vertical_30,
        ...List.generate(
          7,
          (index) => ProfileListTile(
            iconPath: icons[index],
            onTap: () {
              if (index == 1) {
                if (LocalStorage.getToken != null) {
                  Confirm.showLogOutDialog(context);
                  return;
                }
                GoRouter.of(context).push(AppRoutes.auth, extra: true);
                return;
              }
              ModelBottomSheetHelper.showProfileSheets(index);
            },
            title: titles[index],
            tralling: index == 5 ? langs[locale.value]! : 'someData',
          ),
        ),
      ],
    );
  }
}
