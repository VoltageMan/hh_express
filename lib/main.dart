import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hh_express/app/app.dart';
import 'package:hh_express/settings/consts.dart';

void main() {
  runApp(const MyApp());
}

// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation animation;
//   Color? color;

//   @override
//   @mustCallSuper
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 300));
//     animation =
//         ColorTween(begin: AppColors.mainOrange, end: AppColors.lightGray)
//             .animate(controller);
//     animation.addListener(() {
//       log('animm');
//       setState(() {
//         color = animation.value;
//       });
//     });
//     controller.forward();
//   }

//   void ainmate() {
//     color = AppColors.mainOrange;
//     // setState(() {});
//     log('some');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Example")),
//         body: GestureDetector(
//             onDoubleTap: () async {},
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Text(
//                 "HELLO!!!",
//                 textScaleFactor: 3,
//                 style: TextStyle(color: color),
//               ),
//               TextButton(
//                 onPressed: () async {
//                   if (controller.isCompleted) {
//                     controller.reverse();
//                     return;
//                   }
//                   controller.reverse();
//                 },
//                 child: Text(
//                   'animate',
//                 ),
//               )
//             ])),
//       ),
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }
