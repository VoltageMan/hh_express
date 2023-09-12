import 'package:flutter/material.dart';
import 'package:hh_express/features/categories/view/mainCategories/main_category_builder.dart';
import 'package:hh_express/features/categories/view/simpleCategories/simple_categories_builder.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final isSelected = 1 == 2;
    final secondConditions = 1 == 2;

    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                SimpleCategoriesBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Future<void> overlayTest() async {
//   'kuukuk'.log();
//   final overlay = OverlayEntry(
//     builder: (context) {
//       return Container(
//         decoration: BoxDecoration(
//           color: AppColors.appOrange,
//           borderRadius: AppBorderRadiuses.border_6,
//         ),
//       );
//     },
//   );
//   Overlay.of(appRouter.currentContext).insert(overlay);
// }

