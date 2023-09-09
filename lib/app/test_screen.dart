import 'package:flutter/material.dart';

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
        builder: (context) => Scaffold(
          body: Text(
            '${isSelected ? 'this text selected' : 'this text not selected'}',
            style: TextStyle(
              color: isSelected
                  ? Colors.green
                  : secondConditions
                      ? Colors.red
                      : Colors.grey,
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

