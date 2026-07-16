import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Screens/Checkout.dart';
import 'package:store_app/Widgets/Widgets_MyCart/Add_Remove_Number.dart';

import '../Providers/CartProvider.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final cart = context.watch<CartProvider>();


    return Scaffold(

     // backgroundColor: const Color(0xffF7F7F7),


      appBar: AppBar(
        actions: [

          TextButton(

            onPressed: () {

              context
                  .read<CartProvider>()
                  .clearMyCart();

            },


            child: const Text(

              "Delete All",

              style: TextStyle(

                color: Colors.red,

                fontWeight: FontWeight.bold,

                fontSize: 15,

              ),

            ),

          ),

        ],


        elevation: 0,

        centerTitle: true,

        title: const Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),

      ),
      
      body: SafeArea(

        child: cart.cartProducts.isEmpty

            ? Center(

          child: Column(

            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              Icon(
                Icons.shopping_cart_outlined,
                size: 90,
                color: Colors.grey.shade400,
              ),
              SizedBox(height: 15),

              Text(
                "Your Cart is Empty",
                style:  TextStyle(

                  fontSize: 18,

                  color: Colors.grey.shade600,

                  fontWeight: FontWeight.w600,

                ),
              ),
            ],
          ),
        )
        
            : Column(
          children: [

            Expanded(

              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                
                itemCount:
                cart.cartProducts.length,
                
                itemBuilder: (context,index){
                  
                  final product =
                  cart.cartProducts[index];
                  
                  return Container(
                    margin:
                    const EdgeInsets.only(
                      bottom: 18,
                    ),
                    padding:
                    const EdgeInsets.all(15),
                    decoration: BoxDecoration(

                      color: Colors.white,
                      
                      borderRadius:
                      BorderRadius.circular(22),
                      
                      boxShadow: [

                        BoxShadow(

                          color:
                          Colors.black.withOpacity(0.07),
                          blurRadius: 15,
                          offset:
                          const Offset(0,6),

                        ),
                      ],
                    ),
                    
                    child: Row(

                      children: [
                        
                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(18),
                          
                          child: Image.network(
                            product.image,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        
                        const SizedBox(width: 15),
                        Expanded(

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                maxLines: 1,
                                overflow:
                                TextOverflow.ellipsis,
                                style:
                                const TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "\$${product.price}",
                                style:
                                const TextStyle(
                                  color:
                                  Colors.green,
                                  fontSize: 19,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              
                              const SizedBox(height: 12),

                             AddRemoveNumber(
                               product: product,
                             )

                            ],
                          ),
                        ),
                        /////////////////////////////////

                        Container(
                          width: 42,
                          height: 42,

                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            shape: BoxShape.circle,

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),

                          child: IconButton(
                            padding: EdgeInsets.zero,

                            onPressed: () {
                              cart.removeProduct(product);
                            },

                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            Container(
              padding:
              const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                25,
              ),
              
              decoration:
              const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(
                  top:
                  Radius.circular(30),
                ),
              ),
              
              child: Column(
                children: [
                  
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                      Text(
                        "\$${cart.totalPrice}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  SizedBox(
                    width:
                    double.infinity,
                    
                    height:
                    55,
                    child:
                    ElevatedButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout(),));

                      },
                      
                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        Colors.black,
                        
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(18),

                        ),
                      ),
                      
                      child:
                      const Text(

                        "Checkout",

                        style:
                        TextStyle(

                          color:
                          Colors.white,

                          fontSize: 18,

                          fontWeight:
                          FontWeight.bold,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      )
          .animate()
          .fade(delay: 400.ms)
          .slideY(begin: 0.1),
    );
  }
}