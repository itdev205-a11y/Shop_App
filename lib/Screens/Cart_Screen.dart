import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: cart.cartProducts.isEmpty
          ? const Center(
        child: Text(
          "Cart is Empty",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
          : ListView.builder(
        itemCount: cart.cartProducts.length,
        itemBuilder: (context, index) {
          final product = cart.cartProducts[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                product.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(product.name),
              subtitle: Text("\$${product.price}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  cart.removeProduct(product);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}