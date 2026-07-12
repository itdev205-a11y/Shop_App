import 'package:flutter/material.dart';
import 'package:store_app/Screens/Cart_Screen.dart';
import 'package:store_app/Widgets/Widgets_DetailProduct/Cart_Button.dart';
import 'package:store_app/Widgets/Widgets_DetailProduct/Select_Size.dart';

import '../Models/ModelProduct.dart';
import '../Widgets/Widgets_DetailProduct/Favourite_Button.dart';


class DetailScreen extends StatelessWidget {

  final ModelProduct product;


  const DetailScreen({
    super.key,
    required this.product,
  });



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: product.image,
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    child: Image.network(
                      product.image,
                      height: 380,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                      shape: BoxShape.circle,

                      boxShadow: [

                        BoxShadow(

                          color:
                          Colors.black.withOpacity(0.15),

                          blurRadius: 8,

                        ),

                      ],

                    ),

                    child: IconButton(

                      onPressed: () {

                        Navigator.pop(context);

                      },

                      icon: const Icon(

                        Icons.arrow_back,

                      ),

                    ),

                  ),

                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),

                    child: FavouriteButton(
                      product: product,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),

                    child: CartButton(
                      product: product,
                    ),
                  ),
                ),







              ],
            ),

            Expanded(

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                         const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 4),
                            Text('4.5',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Text(

                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),

                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Product description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(

                      'High quality product with modern design. '
                          'Perfect choice for your daily style.',

                      style: TextStyle(
                        color: Colors.grey.shade700,

                        fontSize: 15,

                        height: 1.5,
                      ),
                    ),

                    Divider(),


                    SelectSize(),




                    Divider(),



                    const Spacer(),

                    SizedBox(

                      width: double.infinity,

                      height: 55,

                      child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(15),

                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));



                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


