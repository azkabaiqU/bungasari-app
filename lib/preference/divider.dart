import 'package:flutter/material.dart';
import 'package:bungasari_app/preference/preference.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double height;
  final bool isExpanded;

  const CustomDivider({
    this.color = AppColor.textGrayV2,
    this.thickness = 0.5,
    this.height = 20,
    this.isExpanded = true, // tambahkan flag
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      color: color,
      thickness: thickness,
      height: height,
    );

    return isExpanded ? Expanded(child: divider) : divider;
  }
}
