// lib/styles/border_styles.dart
import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';

final OutlineInputBorder inputBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(7),
  borderSide: BorderSide(color: AppColor.textGrayV2, width: 0.5),
);

final OutlineInputBorder focusedBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(7),
  borderSide: BorderSide(color: AppColor.textGrayV1, width: 1),
);

final OutlineInputBorder errorBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(7),
  borderSide: BorderSide(color: Colors.red, width: 2),
);
