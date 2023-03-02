import 'package:flutter/material.dart';
import 'package:flutter_app_shop/configs/colors.dart';

class AppRegisterTextStyle {
  static lowTextStyle({FontWeight? weight, Color? color}) {
    return TextStyle(
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.colorBlack,
        fontSize: 14.0);
  }

  static normalTextStyle1({FontWeight? weight, Color? color}) {
    return TextStyle(
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.colorBlack,
        fontSize: 16.0);
  }

  static normalTextStyle2({FontWeight? weight, Color? color}) {
    return TextStyle(
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.colorBlack,
        fontSize: 18.0);
  }

  static largeTextStyle1({FontWeight? weight, Color? color}) {
    return TextStyle(
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? AppColors.colorBlack,
        fontSize: 25.0);
  }

  static largeTextStyle2({FontWeight? weight, Color? color}) {
    return TextStyle(
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? AppColors.colorBlack,
        fontSize: 33.0);
  }
}
