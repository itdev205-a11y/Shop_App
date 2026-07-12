import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ModelProduct.dart';
import '../../Providers/CartProvider.dart';

class AddRemoveNumber extends StatelessWidget {

  final ModelProduct product;


  const AddRemoveNumber({
    super.key,
    required this.product,
  });


  @override
  Widget build(BuildContext context) {

    final cart = context.watch<CartProvider>();


    return Row(

      children: [

        IconButton(
          onPressed: () {

            cart.decreaseQuantity(product);

          },

          icon: const Icon(Icons.remove),
        ),



        Text(
          cart.getQuantity(product).toString(),
        ),



        IconButton(
          onPressed: () {

            cart.increaseQuantity(product);

          },

          icon: const Icon(Icons.add),
        ),


      ],

    );

  }

}