import 'package:flutter/material.dart';

class AppColors {
  // Colors D'application du mode clair de l'application
  static Color primaryColor = const Color(0xffF3ADB8);
  static Color primaryColor2 = const Color(0xffED949D);
  static Color scaffoldColor = const Color(0xffF2F1F4);
  static Color widgetActiveColor = const Color(0xffF2AAB5);
  static Color widgetInactiveColor = const Color(0xffC1C6C9);
  static Color colorWhite = Colors.white;
  static Color colorBlack = const Color(0xff090909);
  static Color colorTransparent = Colors.transparent;
  /*
    les couleurs definis ci-dessous sont prise en compte si l'application,
    accepte la prise en charge d'un mode sombre, cet action peut etre declencher
    par le gestionnaire d'etat Riverpod | Getx de l'application.
    Un widget de la couche vue permettre cet action par exemple dans une ecran de settings.
    Decommentez le code ci-dessous
  */
  // static Color bPrimaryColor = const Color(0xff);
  // static Color bPrimaryColor2 = const Color(0xff);
  // static Color bScaffoldColor = const Color(0xff090909);
  // static Color bWidgetActiveColor = const Color(0xff);
  // static Color bWidgetInactiveColor = const Color(0xff);
}
