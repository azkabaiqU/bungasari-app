import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/presentation/form/pages/form_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const PreviousButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "SfPro",
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColor.textBlack,
          ),
        ),
      ),
    );
  }
}