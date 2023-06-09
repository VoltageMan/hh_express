import 'package:flutter/material.dart';
import 'package:hh_express/features/home/view/components/product_widget.dart';

class HomeProdBuilder extends StatelessWidget {
  const HomeProdBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
        
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return HomeProdWidget(
          index: index,
        );
      },
    );
  }
}
