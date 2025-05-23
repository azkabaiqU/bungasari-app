import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/styles/text_style.dart';
import 'package:bungasari_app/preference/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  const RegisterForm({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          keyboardType: TextInputType.phone,
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
