import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double height;

  const CustomDivider({
    this.color =  AppColor.textGrayV2, // default abu-abu
    this.thickness = 0.5,
    this.height = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: color,
        thickness: thickness,
        height: height,
      ),
    );
  }
}
