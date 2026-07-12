import 'package:flutter/material.dart';

Widget orDivider({required Color color}) {
  var color;
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: color,
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          "OR",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: color,
          thickness: 1,
        ),
      ),
    ],
  );
}