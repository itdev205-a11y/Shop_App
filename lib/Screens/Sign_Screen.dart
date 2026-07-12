import 'package:flutter/material.dart';
import 'package:store_app/Widgets/Widgets_SignScreen/Auth_Sign_In.dart';
import '../Widgets/Widgets_SignScreen/Button_Sign_In.dart';
import '../Widgets/Widgets_SignScreen/Button_google_apple.dart';
import '../Widgets/Widgets_SignScreen/Divider.dart';
import '../Widgets/Widgets_SignScreen/Forgot_Password.dart';
import '../Widgets/Widgets_SignScreen/header.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  header(),

                   SizedBox(height: 35),

                  const AuthSignIn(
                    hintText: "Enter your Email",

                  ),

                  const SizedBox(height: 20),

                  AuthSignIn(
                    hintText: "Enter your Password",
                    obscureText: true,
                  ),

                  ForgotPassword(),

                  const SizedBox(height: 10),


                  ButtonSignIn(),

                  const SizedBox(height: 20),

                  orDivider(color: Colors.black),

                  const SizedBox(height: 15),

                  ButtonGoogleApple(
                    text: "Continue with Google",
                    image: "assets/icon/google.jpg",
                    onPressed: () {},
                  ),

                  const SizedBox(height: 15),

                  ButtonGoogleApple(
                    text: "Continue with Apple",
                    image: "assets/icon/apple.jpg",
                    onPressed: () {},
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}