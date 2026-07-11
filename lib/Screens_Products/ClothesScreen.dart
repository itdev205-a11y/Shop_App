import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClothesScreen extends StatelessWidget {
  const ClothesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes'),
      ),
      body: Center(
        child: Text('Clothes Products'),
      ),
    );
  }
}