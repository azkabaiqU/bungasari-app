import 'package:bungasari_app/preference/preference.dart';
import 'package:flutter/material.dart';

import '../../widgets/divider/divider.dart';
import '../../widgets/buttons/input_widget.dart';
import '../../widgets/buttons/google_signin_button.dart';
import '../../styles/text_style.dart';


import 'register_page.dart';
import 'getHelp_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            SizedBox(height: 59),
            // content ----------------------
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 41, right: 23, left: 23, bottom: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // ⬅️ Ini biar text ke kiri
                  children: [
                    Image.asset('assets/image/bungasari_logo_1x.png', width: 54,),
                    SizedBox(height: 10,),
                    Text('Sign in to your account', style: AppTextStyles.TitlefrBigTitle,),
                    SizedBox(height: 22,),
                    GoogleSignInButton(),
                    SizedBox(height: 14,),
                    Row(
                      children: [
                        CustomDivider(),
                        SizedBox(width: 10,),
                        Text(
                          'Or continue with',
                          style: TextStyle(fontSize: 12, color: AppColor.textGrayV1,),
                        ),
                        SizedBox(width: 10,),
                        CustomDivider(),
                      ],
                    ),
                    SizedBox(height: 14,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.5),
                          top: BorderSide(color: Colors.grey, width: 0.5),
                          left: BorderSide(color: Colors.grey, width: 0.5),
                          right: BorderSide(color: Colors.grey, width: 0.5),
                          // atas tidak ada
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                        ),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Email address",
                          hintStyle: AppTextStyles.TextfrHint,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.5),
                          left: BorderSide(color: Colors.grey, width: 0.5),
                          right: BorderSide(color: Colors.grey, width: 0.5),
                          // atas tidak ada
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: AppTextStyles.TextfrHint,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GethelpPage()),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: AppColor.textBlack, // opsional, biar kelihatan kayak link
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        padding: const EdgeInsets.only(right: 1),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
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
                            'Continue',
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
                  'Have’t Make Account?',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(width: 5),
                Text('Sign Up', style: TextStyle(fontSize: 14, decoration: TextDecoration.underline),)
              ],
            )
          ],
        ),
      ),
    );
  }
}