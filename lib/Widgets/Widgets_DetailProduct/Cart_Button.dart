import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ModelProduct.dart';
import '../../Providers/CartProvider.dart';
import '../../Screens/Cart_Screen.dart';

class CartButton extends StatelessWidget {
  final ModelProduct product;

  const CartButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shopping_cart_outlined),
      onPressed: () {
        context.read<CartProvider>().addProduct(product);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CartScreen(),
          ),
        );
      },
    );
  }
}