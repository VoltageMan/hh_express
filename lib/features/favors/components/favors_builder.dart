import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/favors/components/favors_widget.dart';

class FavrosBuilder extends StatefulWidget {
  const FavrosBuilder({super.key});

  @override
  State<FavrosBuilder> createState() => _FavrosBuilderState();
}

class _FavrosBuilderState extends State<FavrosBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const FavorsWidget();
        },
      ),
    );
  }
}
