import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/repositories/product_details/product_details_repository.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final repo = getIt<ProductDetailsRepo>();
  @override
  Widget build(BuildContext context) {
    LocalStorage.init();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final data = await repo.get(1, CancelToken());
            data?.toJson().log();
          },
          child: Text(
            'fetch',
          ),
        ),
      ),
    );
  }
}
