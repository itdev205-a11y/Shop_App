import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/Go_Router.dart';

import 'WIDGETS/TextFeild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFFAF3E0),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [



                TextButton(onPressed: (){


                  context.push('/screens');


                }, child: Text('SKIP')),

                Lottie.asset(
                  'assets/animation/Welcome.json',
                  height: 150,
                  width: 250
                ),


                CustomTextField(
                  icon: Icons.person,
                  hintText: 'Your Name',
                  controller: Name,

                ),

                SizedBox(height: 20,),
                CustomTextField(
                  icon: Icons.email,
                  hintText: 'Your Email',
                  controller: Email,

                ),








              ],
            ),
          ),
        ),
      ),
    );
  }
}