import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isOverLimit;
  final int maxLength;
  final Function(String) onTextChanged;

  const CompanyField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.isOverLimit,
    required this.maxLength,
    required this.onTextChanged,
  }) : super(key: key);

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
        Container(
          height: 206,
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: isOverLimit ? Colors.red : AppColor.textGrayV2,
              width: 0.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  onChanged: onTextChanged,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle: AppTextStyles.TextfrHint,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "${controller.text.length} / $maxLength Kata",
                style: TextStyle(
                  color: isOverLimit ? Colors.red : AppColor.textGrayV2,
                ),
              ),
            ],
          ),
        ),
        if (isOverLimit)
          const Column(
            children: [
              SizedBox(height: 2),
              Text(
                "Anda melewati batas kata.",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontFamily: "SfPro",
                ),
              ),
            ],
          ),
      ],
    );
  }
}
