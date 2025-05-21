import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/presentation/auth/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/text_style.dart';
import '../../widgets/buttons/input_widget.dart';

import '../../bloc/register/register_bloc.dart';
import '../../bloc/register/register_state.dart';
import '../../bloc/register/register_event.dart';

import '../connector.dart';
import '../home/page/home_page.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

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
                    // nama user
                    Text(
                      'Name',
                      style: TextStyle(
                        fontFamily: "SfPro",
                        fontSize: 16,
                        color: AppColor.textGrayV1,
                      ),
                    ),
                    SizedBox(height: 7),
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "asep sudirman",
                        hintStyle: AppTextStyles.TextfrHint,

                        border: OutlineInputBorder(),
                        enabledBorder: inputBorderStyle,
                        focusedBorder: focusedBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                    ),
                    SizedBox(height: 25),

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
                      controller: emailController,
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
                      controller: passwordController,
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
                      controller: confirmController,
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
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child:                 Text('Sign in', style: TextStyle(fontSize: 14, decoration: TextDecoration.underline),)

                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}