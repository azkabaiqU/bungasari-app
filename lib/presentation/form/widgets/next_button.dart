import 'package:bungasari_app/preference/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const NextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Hapus width double.infinity ini
      alignment: AlignmentDirectional.centerEnd,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.black,
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
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColor.textWhite,
          ),
        ),
      ),
    );
  }
}
