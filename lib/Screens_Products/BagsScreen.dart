import 'package:flutter/material.dart';

class BagsScreen extends StatelessWidget {
  const BagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bags'),
      ),
      body: const Center(
        child: Text('Bags Products'),
      ),
    );
  }
}