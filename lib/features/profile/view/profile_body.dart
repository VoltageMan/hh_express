import 'package:flutter/cupertino.dart';
import 'package:hh_express/features/profile/components/profile_list_tile.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/spacers.dart';
import 'package:hh_express/settings/consts.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});
  static List<String> icons = [
    AssetsPath.profileIcon,
    AssetsPath.phoneIcon,
    AssetsPath.ordersIcon,
    AssetsPath.favorIcon,
    AssetsPath.locationIcon,
    AssetsPath.langIcon,
  ];
  static List<String> titles = [
    'Ulanyjynyn ady',
    'Telefon belgim',
    'Sargytlarym',
    'halanlarym',
    'Welayat',
    'Programmanyn dili',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.vertical_30,
        ...List.generate(
          6,
          (index) => ProfileListTile(
            iconPath: icons[index],
            onTap: () => 'Helele'.log(),
            title: titles[index],
            tralling: 'Trealling',
          ),
        ),
      ],
    );
  }
}
