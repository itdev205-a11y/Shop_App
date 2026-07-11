import 'package:flutter/material.dart';
import 'package:store_app/Widgets/Widgets_HomeScreen/Haeder.dart';
import 'package:store_app/Widgets/Widgets_HomeScreen/row_category.dart';
import 'package:store_app/Widgets/Widgets_HomeScreen/textfield_search.dart';

import '../Widgets/Widgets_HomeScreen/Category+see all.dart';
import '../Widgets/Widgets_HomeScreen/TabBar_HomeScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Header(),

              const SizedBox(height: 20),

              const TextfieldSearch(),

              const SizedBox(height: 25),

              const CategorySeeAll(),

              const SizedBox(height: 15),

              const RowCategory(),
              const SizedBox(height: 15),

              TabbarHomescreen(),
            ],
          ),
        ),
      ),
    );
  }
}