import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';

class AppTextStyles {
  // final data & desc,
  static const TextStyle TitlefrFinalData = TextStyle(
    fontFamily: "SfProDisplay",
    fontSize: 16,
    color: AppColor.textBlack,
  );

  static const TextStyle DescfrFinalData = TextStyle(
    fontFamily: "SfPro",
    fontSize: 14,
    color: AppColor.textGrayV1,
    fontWeight: FontWeight.w400,
  );
  // Judul besar
  static const TextStyle TitlefrBigTitle = TextStyle(
    fontFamily: "SfProDisplay",
    fontSize: 24,
    color: AppColor.textBlack,
  );
  // text di peringatan
  static const TextStyle TextfrAttention = TextStyle(
    fontFamily: "SfPro",
    fontSize: 14,
    color: AppColor.textFrOrange,
  );
  // hint text style
  static const TextStyle TextfrHint = TextStyle(
    fontFamily: 'SfPro',
    fontSize: 16,
    color: AppColor.textGrayV2,
  );
}