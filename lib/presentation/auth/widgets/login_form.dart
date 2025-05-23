import 'package:bungasari_app/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final BorderRadius borderRadius;
  const LoginForm({
    super.key,
    required this.hintText,
    required this.controller,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
          top: BorderSide(color: Colors.grey, width: 0.5),
          left: BorderSide(color: Colors.grey, width: 0.5),
          right: BorderSide(color: Colors.grey, width: 0.5),
          // atas tidak ada
        ),
        borderRadius: borderRadius,
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.TextfrHint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 12, vertical: 14),
        ),
      ),
    );
  }
}