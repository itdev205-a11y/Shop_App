import 'package:flutter/material.dart';
import '../Models/ModelProduct.dart';

class DetailScreen extends StatelessWidget {

  final ModelProduct product;

  const DetailScreen({
    super.key,
    required this.product,
    required List products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Image.network(
              product.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product.subscribe,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

          ],
        ),
      ),
    );
  }
}