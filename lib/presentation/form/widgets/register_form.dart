import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/styles/text_style.dart';
import 'package:bungasari_app/preference/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  const RegisterForm({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: "SfPro",
            fontSize: 16,
            color: AppColor.textGrayV1,
          ),
        ),
        SizedBox(height: 7),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.TextfrHint,
            border: OutlineInputBorder(),
            enabledBorder: inputBorderStyle,
            focusedBorder: focusedBorderStyle,
            errorBorder: errorBorderStyle,
            focusedErrorBorder: errorBorderStyle,
          ),
        ),
      ],
    );
  }
}