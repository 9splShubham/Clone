import 'package:clone/core/app_color.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static const avenirRegular = 'AvenirRegular';
  static const avenirBold = 'AvenirBold';

  static const regular = TextStyle(
      fontFamily: avenirRegular,
      fontWeight: FontWeight.w400,
      color: AppColor.colorWhite);

  static const bold = TextStyle(
      fontFamily: avenirRegular,
      fontWeight: FontWeight.w700,
      color: AppColor.colorBlack);
  static const semiBold = TextStyle(
      fontFamily: avenirRegular,
      fontWeight: FontWeight.w600,
      color: AppColor.colorWhite);
  static const mediumBold = TextStyle(
      fontFamily: avenirRegular,
      fontWeight: FontWeight.w500,
      color: AppColor.colorWhite);

  ///-------REGULAR-------------
  ///colorGreen
  static final regularGreen = regular.copyWith(color: AppColor.colorPrimary);
  static final boldGreen = bold.copyWith(color: AppColor.colorPrimary);
  static final semiBoldGreen = semiBold.copyWith(color: AppColor.colorPrimary);
  static final mediumBoldGreen =
      mediumBold.copyWith(color: AppColor.colorPrimary);

  ///colorBlack
  static final regularBlack = regular.copyWith(color: AppColor.colorBlack);
  static final boldBlack = bold.copyWith(color: AppColor.colorBlack);
  static final semiBoldBlack = semiBold.copyWith(color: AppColor.colorBlack);
  static final mediumBoldBlack =
      mediumBold.copyWith(color: AppColor.colorBlack);

  ///colorBlack2
  static final regularBlack2 = regular.copyWith(color: AppColor.colorBlack);
  static final boldBlack2 = bold.copyWith(color: AppColor.colorBlack);
  static final semiBoldBlack2 = semiBold.copyWith(color: AppColor.colorBlack);
  static final mediumBoldBlack2 =
      mediumBold.copyWith(color: AppColor.colorBlack);

  ///colorGrey
  static final regularGrey = regular.copyWith(color: AppColor.colorgrey);
  static final boldGrey = bold.copyWith(color: AppColor.colorgrey);
  static final semiBoldGrey = semiBold.copyWith(color: AppColor.colorgrey);
  static final mediumBoldGrey = mediumBold.copyWith(color: AppColor.colorgrey);
}

/// A [getTextStyle] This Method Use to getTextStyle
TextStyle getTextStyle(TextStyle mainTextStyle, double size) {
  return mainTextStyle.copyWith(fontSize: size);
}

/// A [getTextStyleFontWeight] This Method Use to get Text Style with FontWeight
TextStyle getTextStyleFontWeight(
    TextStyle mainTextStyle, double size, FontWeight fontWeight) {
  return mainTextStyle.copyWith(fontSize: size, fontWeight: fontWeight);
}
