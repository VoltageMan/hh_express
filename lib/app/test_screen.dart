import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:hh_express/features/home/view/components/product_widget.dart';
import 'package:hh_express/features/product_details/bloc/product_details_bloc.dart';
import 'package:hh_express/features/product_details/view/product_details.dart';
import 'package:hh_express/models/products/product_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return bloc.BlocProvider(
      create: (context) => ProductDetailsBloc(),
      child: ProductDetails(
        id: 0,
      ),
    );
  }
}

class MySimpleScreen extends StatefulWidget {
  const MySimpleScreen({super.key});

  @override
  State<MySimpleScreen> createState() => _MySimpleScreenState();
}

class _MySimpleScreenState extends State<MySimpleScreen> {
  int rebuilded = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'reBuilded $rebuilded times',
        ),
      ),
      body: MySimpleScreenBody(),
    );
  }
}

class MySimpleScreenBody extends StatelessWidget {
  const MySimpleScreenBody({super.key, this.model});
  final ProductModel? model;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HomeProdWidget(
        index: 0,
      ),
    );
  }
}
