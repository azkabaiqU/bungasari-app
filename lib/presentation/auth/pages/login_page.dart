import 'dart:convert';

import 'package:bungasari_app/core/core.dart';
import 'package:bungasari_app/data/dataresource/auth_local_dataresource.dart';
import 'package:bungasari_app/preference/divider.dart';
import 'package:bungasari_app/preference/preference.dart';
import 'package:bungasari_app/presentation/auth/blocs/login/login_bloc.dart';
import 'package:bungasari_app/presentation/auth/pages/getHelp_page.dart';
import 'package:bungasari_app/presentation/auth/pages/register_page.dart';
import 'package:bungasari_app/presentation/auth/widgets/auth_button.dart';
import 'package:bungasari_app/presentation/auth/widgets/login_form.dart';
import 'package:bungasari_app/presentation/connector.dart';
import 'package:bungasari_app/styles/text_style.dart';
import 'package:bungasari_app/presentation/auth/widgets/google_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                  crossAxisAlignment:
                  CrossAxisAlignment.center, // ⬅️ Ini biar text ke kiri
                  children: [
                    Image.asset(
                      'assets/image/bungasari_logo_1x.png',
                      width: 54,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign in to your account',
                      style: AppTextStyles.TitlefrBigTitle,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    GoogleSignInButton(),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        CustomDivider(),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Or continue with',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.textGrayV1,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomDivider(),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    LoginForm(
                      hintText: 'Email Address',
                      controller: usernameController,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                      ),
                    ),
                    LoginForm(
                      hintText: 'Password',
                      controller: passwordController,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GethelpPage()),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: AppColor
                              .textBlack, // opsional, biar kelihatan kayak link
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if(state is LoginSuccess){
                          AuthLocalDataresource().saveAuthData(state.authResponseModel);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ConnectorPage(),
                              ),
                          );
                        }
                        if(state is LoginFailure){
                          final errorMessage = jsonDecode(state.message) ['message'];

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage))
                          );
                        }
                      },
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return AuthButton(onPressed: () {
                            context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                  email: usernameController.text,
                                  password: passwordController.text
                              ),
                            );
                          }, title: 'Login');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Haven’t made an account?',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: AppColor.bgBtnBlack,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
