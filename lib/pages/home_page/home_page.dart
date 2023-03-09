import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_shop/configs/colors.dart';
import 'package:flutter_app_shop/configs/styles.dart';
import 'package:flutter_app_shop/pages/home_page/fragments/card_fragment/card_fragment.dart';
import 'package:flutter_app_shop/pages/home_page/fragments/home_fragment/home_fragment.dart';
import 'package:flutter_app_shop/pages/home_page/fragments/notification_fragment/notification_fragment.dart';
import 'package:flutter_app_shop/pages/home_page/fragments/profile_fragment/profile_fragment.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fragments = const [
    HomeFragment(),
    NotificationFragment(),
    CardFragment(),
    ProfileFragment()
  ];

  final appbarTitleWidgets = [
    Column(
      children: [
        Text(
          "Hello Zoskio",
          style: AppRegisterTextStyle.lowTextStyle(
              weight: FontWeight.w600, color: AppColors.colorBlack.withOpacity(.75)),
        ),
        Text(
          "Yves Jansene Kouame",
          style: AppRegisterTextStyle.normalTextStyle2(
              color: AppColors.colorBlack, weight: FontWeight.w600),
        )
      ],
    ),
    Text(
      "Notification",
      style: AppRegisterTextStyle.normalTextStyle2(
          color: AppColors.colorBlack, weight: FontWeight.w600),
    ),
    Text(
      "Card",
      style: AppRegisterTextStyle.normalTextStyle2(
          color: AppColors.colorBlack, weight: FontWeight.w600),
    ),
    Text(
      "You Profile",
      style: AppRegisterTextStyle.normalTextStyle2(
          color: AppColors.colorBlack, weight: FontWeight.w600),
    ),
  ];

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Bounce(
          duration: const Duration(milliseconds: 180),
          onPressed: () {
            // Ouverture d'un potentiel menu
          },
          child: Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: AppColors.colorWhite, shape: BoxShape.circle),
            margin: const EdgeInsets.only(left: 10),
            child: Icon(
              CupertinoIcons.list_dash,
              color: AppColors.primaryColor2,
            ),
          ),
        ),
        title: appbarTitleWidgets[currentIndex],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 45.0,
              height: 45.0,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/profile.jpg"), fit: BoxFit.cover)),
              //child: const Icon(CupertinoIcons.profile_circled),
            ),
          )
        ],
      ),
      body: fragments[currentIndex],
      bottomNavigationBar: _bottomNavigationbar(),
    );
  }

  int currentIndex = 0;
  bool getHomeIndexFragment() => currentIndex == 0;
  bool getNotifIndexFragment() => currentIndex == 1;
  bool getCardIndexFragment() => currentIndex == 2;
  bool getProfileIndexFragment() => currentIndex == 3;

  Widget _bottomNavigationbar() {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, -2),
                color: AppColors.colorTransparent,
                spreadRadius: 2,
                blurRadius: 2)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Bounce(
            duration: const Duration(milliseconds: 150),
            onPressed: () {
              setState(() {
                currentIndex = 0;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getHomeIndexFragment() ? Colors.grey.shade100 : Colors.grey.shade200),
                  child: Icon(getHomeIndexFragment() ? Icons.house_rounded : Icons.house_outlined,
                      size: 35,
                      color: getHomeIndexFragment()
                          ? AppColors.primaryColor
                          : AppColors.colorBlack.withOpacity(.50))),
            ),
          ),
          Bounce(
            duration: const Duration(milliseconds: 150),
            onPressed: () {
              setState(() {
                currentIndex = 1;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getNotifIndexFragment() ? Colors.grey.shade100 : Colors.grey.shade200),
                  child: Icon(
                      getNotifIndexFragment() ? CupertinoIcons.bell_solid : CupertinoIcons.bell,
                      size: 27,
                      color: getNotifIndexFragment()
                          ? AppColors.primaryColor
                          : AppColors.colorBlack.withOpacity(.50))),
            ),
          ),
          Bounce(
            duration: const Duration(milliseconds: 150),
            onPressed: () {
              setState(() {
                currentIndex = 2;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getCardIndexFragment() ? Colors.grey.shade100 : Colors.grey.shade200),
                  child: Icon(
                      getCardIndexFragment() ? CupertinoIcons.cart_fill : CupertinoIcons.cart,
                      size: 27,
                      color: getCardIndexFragment()
                          ? AppColors.primaryColor
                          : AppColors.colorBlack.withOpacity(.50))),
            ),
          ),
          Bounce(
            duration: const Duration(milliseconds: 150),
            onPressed: () {
              setState(() {
                currentIndex = 3;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          getProfileIndexFragment() ? Colors.grey.shade100 : Colors.grey.shade200),
                  child: Icon(
                      getProfileIndexFragment()
                          ? CupertinoIcons.person_fill
                          : CupertinoIcons.person,
                      size: 27,
                      color: getProfileIndexFragment()
                          ? AppColors.primaryColor
                          : AppColors.colorBlack.withOpacity(.50))),
            ),
          )
        ],
      ),
    );
  }
}
