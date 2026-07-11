import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../Screens_Products/AccessoriesScreen.dart';
import '../../Screens_Products/BagsScreen.dart';
import '../../Screens_Products/ClothesScreen.dart';


class RowCategory extends StatelessWidget {
  const RowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategory(
          context,
          Bootstrap.handbag,
          'Bags',
          const BagsScreen(),
        ),

        _buildCategory(
          context,
          Bootstrap.shop,
          'Clothes',
          const ClothesScreen(),
        ),

        _buildCategory(
          context,
          Bootstrap.gem,
          'Accessories',
          const AccessoriesScreen(),
        ),
      ],
    );
  }
}

Widget _buildCategory(
    BuildContext context,
    IconData icon,
    String text,
    Widget page,
    ) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    },

    child: Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}