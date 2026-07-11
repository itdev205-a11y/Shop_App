import 'package:flutter/material.dart';

class AccessoriesScreen extends StatelessWidget {
  const AccessoriesScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessories'),
      ),
      body: const Center(
        child: Text('Accessories Products'),
      ),
    );
  }
}