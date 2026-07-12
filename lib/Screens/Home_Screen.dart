import 'package:flutter/material.dart';
import 'package:store_app/Widgets/Widgets_HomeScreen/Haeder.dart';
import 'package:store_app/Widgets/Widgets_HomeScreen/Row_Fashion.dart';
import 'package:store_app/Widgets/Widgets_HomeScreen/textfield_search.dart';

import '../Widgets/Widgets_HomeScreen/Category+see all.dart';
import '../Widgets/Widgets_HomeScreen/TabBar_HomeScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Header(),

              SizedBox(height: 10),



              TextfieldSearch(),
              SizedBox(height: 10),


RowFashion(),

              SizedBox(height: 25),

              CategorySeeAll(),

              SizedBox(height: 15),

              TabbarHomescreen(),
            ],
          ),
        ),
      ),
    );
  }
}