
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';

class CustomStyle {
  static TextStyle appbartitle = const TextStyle(
      color: AppColors.white,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w500,
      fontSize: 20);
  static TextStyle calaender = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w600,
      fontSize: 20);
  static TextStyle hello =const TextStyle(
    color: AppColors.white,
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static TextStyle name =const TextStyle(
    color: AppColors.white,
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );
  static TextStyle cardtext =const TextStyle(
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );

  //splash screen
  static TextStyle title = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w600,
      fontSize: 32);
  static TextStyle optimze = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w400,
      fontSize: 20);

  //Login Screen
  static TextStyle login = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w600,
      fontSize: 32);
  static TextStyle everything = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w300,
      fontSize: 24);
  static TextStyle txtvalue = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w400,
      fontSize: 18);
  static TextStyle txthintvalue = TextStyle(
      color: AppColors.secondary.withOpacity(0.4),
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w500,
      fontSize: 18);
  static TextStyle txtvalue1 = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w400,
      fontSize: 14);
  static TextStyle txtvalue2 = const TextStyle(
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w500,
      fontSize: 18);
  static TextStyle id = const TextStyle(
      fontFamily: 'Outfit',
      color: AppColors.white,
      fontWeight: FontWeight.w900,
      fontSize: 32);
  static TextStyle txtvalue3 = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w600,
      fontSize: 18);
  static TextStyle txtvalue4 = const TextStyle(
      color: AppColors.secondary,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w500,
      fontSize: 16);
  static DottedLine dottedLine=  DottedLine(
    dashLength: 5,
    dashGapLength: 1,
    lineThickness: 1,
    dashColor: AppColors.secondary.withOpacity(0.05),
    direction: Axis.horizontal,
  );
}
