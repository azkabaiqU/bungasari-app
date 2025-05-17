import 'package:bungasari_app/preference/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/text_style.dart';
import '../../widgets/buttons/input_widget.dart';

import '../home/page/home_page.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgBasic,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/image/bungasari_logo_1x.png',
                  width: 18,
                ),
                SizedBox(width: 4.4),
                Text('Bungasari',
                    style: TextStyle(
                        fontFamily: "SfPro",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.textBlack))
              ],
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 43, right: 23, left: 23, bottom: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s Make\nYour Account\nbefore Collaborate!',
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 32,
                        fontFamily: "SfProDisplay",
                        // fontWeight: FontWeight.w500,
                        color: AppColor.textBlack,
                      ),
                    ),
                    SizedBox(height: 24),
                    // Email address
                    Text(
                      'Email address',
                      style: TextStyle(
                        fontFamily: "SfPro",
                        fontSize: 16,
                        color: AppColor.textGrayV1,
                      ),
                    ),
                    SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Akapack@gmail.com",
                        hintStyle: AppTextStyles.TextfrHint,

                        border: OutlineInputBorder(),
                        enabledBorder: inputBorderStyle,
                        focusedBorder: focusedBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                    ),
                    SizedBox(height: 25),
                    // Phone number
                    Text(
                      'Phone number',
                      style: TextStyle(
                        fontFamily: "SfPro",
                        fontSize: 16,
                        color: AppColor.textGrayV1,
                      ),
                    ),
                    SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "082082082",
                        hintStyle: AppTextStyles.TextfrHint,

                        border: OutlineInputBorder(),
                        enabledBorder: inputBorderStyle,
                        focusedBorder: focusedBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                    ),
                    SizedBox(height: 25),
                    // Password
                    Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: "**********",
                        fontSize: 16,
                        color: AppColor.textGrayV1,
                      ),
                    ),
                    SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "**********",
                        hintStyle: AppTextStyles.TextfrHint,

                        border: OutlineInputBorder(),
                        enabledBorder: inputBorderStyle,
                        focusedBorder: focusedBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                    ),
                    SizedBox(height: 25),
                    // Confirm Password
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontFamily: "SfPro",
                        fontSize: 16,
                        color: AppColor.textGrayV1,
                      ),
                    ),
                    SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "**********",
                        hintStyle: AppTextStyles.TextfrHint,

                        border: OutlineInputBorder(),
                        enabledBorder: inputBorderStyle,
                        focusedBorder: focusedBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Submit
                    Container(
                        padding: const EdgeInsets.only(right: 1),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            ); },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.bgBtnBlack,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I Have Account!',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(width: 5),
                Text('Sign in', style: TextStyle(fontSize: 14, decoration: TextDecoration.underline),)
              ],
            )
          ],
        ),
      ),
    );
  }
}