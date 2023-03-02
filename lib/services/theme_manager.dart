import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_shop/configs/colors.dart';

class ThemeManagerService {
  static ThemeData applyLightMode() {
    /*
      Vous pouvez ajouter encore plus de personnalisation au widgets,
      Celle-ci sont selon la maquette primondiale, cett fonctionne ce chargera de 
      permutter les differents styles des widget et redessinera avec les valeurs correpondant
      au theme sombre.
    */
    return ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: AppColors.colorBlack, size: 25),
        textTheme: TextTheme(
          bodySmall:
              TextStyle(color: AppColors.colorBlack, fontSize: 15.0, fontWeight: FontWeight.normal),
          bodyMedium:
              TextStyle(color: AppColors.colorBlack, fontSize: 18, fontWeight: FontWeight.w500),
          bodyLarge:
              TextStyle(color: AppColors.colorBlack, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.scaffoldColor,
            centerTitle: true, // see mockup
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.scaffoldColor,
              systemNavigationBarColor: AppColors.scaffoldColor,
            ),
            elevation: .0,
            titleTextStyle: TextStyle(
                color: AppColors.colorBlack,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal),
            toolbarTextStyle: TextStyle(
                color: AppColors.colorBlack,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal),
            iconTheme: IconThemeData(color: AppColors.colorBlack, size: 23.0, fill: 1)));
  }

  static ThemeData applyDarkMode() {
    /*
      Vous pouvez ajouter encore plus de personnalisation au widgets,
      Celle-ci sont selon la maquette primondiale, cett fonctionne ce chargera de 
      permutter les differents styles des widget et redessinera avec les valeurs correpondant
      au theme sombre.
    */
    return ThemeData();
  }
}
