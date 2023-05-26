import 'package:flutter/material.dart';
import 'package:hh_express/features/home/view/home_screen.dart';
import 'package:hh_express/features/mainScreen/view/main_app_bar.dart';
import 'package:hh_express/features/mainScreen/view/navBar/nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'title',
      ),
      body: HomeScreen(),
      bottomNavigationBar: const MyBNavigationBar(),
    );
  }
}
