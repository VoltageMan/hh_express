import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/features/components/confirm_some.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/auth/auth_model.dart';
import 'package:hh_express/repositories/auth/auth_repositori.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final repo = getIt<AuthRepo>();
  String? token = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          ConfirmSomeTh(
            title: 'Auht Me',
            width: 200.w,
            onTap: () async {
              try {
                // final response = await repo.authMe();
              } catch (e, stack) {}
            },
          ),
          SizedBox(
            width: double.infinity,
            height: 30.h,
          ),
          ConfirmSomeTh(
            title: 'logIn',
            width: 200.w,
            onTap: () async {
              final response = await repo
                  .logIn(AuthModel(entity: '99366666666', password: '12345'));
              token = response.data['access_token'];
            },
          ),
        ],
      ),
    );
  }
}
