import 'package:flutter/material.dart';
import 'package:hh_express/features/notifications/view/notifications_app_bar.dart';
import 'package:hh_express/features/notifications/view/widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationsAppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const NotificationWidget();
        },
      ),
    );
  }
}
