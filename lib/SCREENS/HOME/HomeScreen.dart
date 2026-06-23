import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'WIDGETS_HomeScreen/Categories_Row.dart';
import 'WIDGETS_HomeScreen/Fashion.dart';
import 'WIDGETS_HomeScreen/Haeder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      body: Column(
          children: [
            HEADER(context),

            const SizedBox(height: 10),

            const Fashion(),

            const SizedBox(height: 20),

            const CategoriesRow(),

            const SizedBox(height: 10),


          ],
        ),

    );
  }
}