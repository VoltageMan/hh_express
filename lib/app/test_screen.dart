import 'package:flutter/material.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/order_history/order_history_model.dart';
import 'package:hh_express/repositories/order/order_repo.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final repo = getIt<OrderRepo>();
  @override
  Widget build(BuildContext context) {
    LocalStorage.init();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            LocalStorage.getToken..log();
            final data = await repo.getOrderHistory(0);
            (data?.data)!.first.toJson().log();
          },
          child: Text(
            'fetch',
          ),
        ),
      ),
    );
  }
}
