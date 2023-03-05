import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_shop/configs/colors.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class CustomDetailItemAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String imgUrl;
  const CustomDetailItemAppbar({super.key, required this.imgUrl})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  final Size preferredSize;

  @override
  State<CustomDetailItemAppbar> createState() => _CustomDetailItemAppbarState();
}

class _CustomDetailItemAppbarState extends State<CustomDetailItemAppbar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(30), bottomEnd: Radius.circular(30)),
      child: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height - 430,
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.yellow,
        flexibleSpace: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 400,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 10),
                    color: AppColors.primaryColor.withOpacity(.50),
                    spreadRadius: 10,
                    blurRadius: 10)
              ],
              gradient: LinearGradient(colors: [
                AppColors.primaryColor,
                AppColors.primaryColor2,
              ])),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _intarractButton(
                        icon: Icons.info_outline,
                        pressed: () {
                          Navigator.pop(context);
                        }),
                    _intarractButton(icon: CupertinoIcons.heart, pressed: () {}),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.imgUrl), fit: BoxFit.fill)),
                ),
              )
            ],
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.colorTransparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
      ),
    );
  }

  // Astuce: pour avoir un bon projet, bien compris,
  // il est recommander d'appliquer le principe du clean-architecture, qui consiste
  // a cree des tous composant qui serait utiliser +2 fois dans l'application
  Widget _intarractButton({required IconData icon, required VoidCallback pressed}) {
    return Bounce(
      duration: const Duration(milliseconds: 150),
      onPressed: pressed,
      child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
              color: AppColors.scaffoldColor.withOpacity(.90), shape: BoxShape.circle),
          child: Icon(
            icon,
            color: AppColors.primaryColor2,
          )),
    );
  }
}
