import 'package:flutter/material.dart';
import 'package:flutter_app_shop/configs/styles.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile Fragment",
              style: AppRegisterTextStyle.normalTextStyle2(weight: FontWeight.w600),
            ),
            Text(
              "No design yet",
              style: AppRegisterTextStyle.normalTextStyle1(),
            ),
          ],
        ),
      ),
    );
  }
}
