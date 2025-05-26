import 'dart:convert';

import 'package:bungasari_app/preference/color.dart';
import 'package:bungasari_app/presentation/auth/pages/login_page.dart';
import 'package:bungasari_app/presentation/auth/widgets/auth_button.dart';
import 'package:bungasari_app/presentation/auth/widgets/register_form.dart';
import 'package:bungasari_app/presentation/connector.dart';
import 'package:bungasari_app/styles/text_style.dart';
import 'package:bungasari_app/preference/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/register/register_bloc.dart';

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
                    // Name
                    RegisterForm(
                      title: 'Name',
                      hintText: 'Input Your Name',
                      controller: nameController,
                    ),
                    SizedBox(height: 25),
                    // Email
                    RegisterForm(
                      title: 'Email',
                      hintText: 'Input Your Email',
                      controller: emailController,
                    ),
                    SizedBox(height: 25),
                    // Password
                    RegisterForm(
                      title: 'Password',
                      hintText: 'Input Your Password',
                      controller: passwordController,
                    ),
                    SizedBox(height: 25),
                    // Confirm Password
                    RegisterForm(
                      title: 'Confirm ',
                      hintText: 'Confirm Your Password',
                      controller: confirmController,
                    ),
                    SizedBox(height: 20),
                    // Submit
                    BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if(state is RegisterSuccess){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConnectorPage(),
                              ),
                          );
                        }
                        if(state is RegisterFailure){
                         final errorMessage = jsonDecode(state.message)['message'];

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage))
                          );
                        }
                      },
                      builder: (context, state) {
                        if(state is RegisterLoading){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return AuthButton(
                          onPressed: () {
                            final password = passwordController.text;
                            final confirmPassword = confirmController.text;

                            if (password != confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Password and Confirm Password do not match!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return; // Jangan lanjut kalau tidak sama
                            }

                            // Kalau sama, lanjut ke event Bloc
                            context.read<RegisterBloc>().add(
                              RegisterButtonPressed(
                                name: nameController.text,
                                email: emailController.text,
                                password: password,
                              ),
                            );
                          },
                          title: 'Register',
                        );

                      },
                    )

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
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 14, decoration: TextDecoration.underline),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
