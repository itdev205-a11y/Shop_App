import 'package:flutter/material.dart';

Widget header() {
  return Column(
    children: [
     Image.asset('aseets/animation/welcome.json'),

      const SizedBox(height: 30),

      const Text(
        "Welcome Back",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      Text(
        "Sign in to continue shopping",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade600,
        ),
      ),
    ],
  );
}