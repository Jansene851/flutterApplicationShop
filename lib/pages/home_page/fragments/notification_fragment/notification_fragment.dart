import 'package:flutter/material.dart';
import 'package:flutter_app_shop/configs/styles.dart';

class NotificationFragment extends StatefulWidget {
  const NotificationFragment({super.key});

  @override
  State<NotificationFragment> createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nothing Notification yet",
              style: AppRegisterTextStyle.normalTextStyle2(weight: FontWeight.w600),
            ),
            Text(
              "If you have notification, you can see there",
              style: AppRegisterTextStyle.normalTextStyle1(),
            ),
          ],
        ),
      ),
    );
  }
}
