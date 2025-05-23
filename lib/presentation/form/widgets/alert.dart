import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String message;
  const Alert({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.bgOrange,
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      padding: EdgeInsets.all(17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 16,
              height: 16,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                ),
                child: Image.asset(
                  'assets/image/tandaseru_icon.png',
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
                message,
                style: AppTextStyles.TextfrAttention),
          ),
        ],
      ),
    );
  }
}