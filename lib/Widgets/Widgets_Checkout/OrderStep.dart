import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/CartProvider.dart';


class OrderStep extends StatelessWidget {

  const OrderStep({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    final cart = context.watch<CartProvider>();


    return Container(

      padding:
      const EdgeInsets.all(20),


      decoration:
      BoxDecoration(

        color:
        Colors.white,

        borderRadius:
        BorderRadius.circular(20),


        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withOpacity(0.05),

            blurRadius:10,

            offset:
            const Offset(0,5),

          ),

        ],

      ),



      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [



          const Text(

            "Order Summary",

            style:
            TextStyle(

              fontSize:22,

              fontWeight:
              FontWeight.bold,

            ),

          ),



          const SizedBox(height:25),



          Row(

            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,


            children: [


              const Text(

                "Products",

                style:
                TextStyle(

                  fontSize:17,

                  fontWeight:
                  FontWeight.w500,

                ),

              ),



              Text(

                "${cart.cartProducts.length}",

                style:
                const TextStyle(

                  fontSize:17,

                  fontWeight:
                  FontWeight.bold,

                ),

              ),


            ],

          ),




          const SizedBox(height:20),




          Row(

            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,


            children: [


              const Text(

                "Total Price",

                style:
                TextStyle(

                  fontSize:18,

                  fontWeight:
                  FontWeight.bold,

                ),

              ),



              Text(

                "\$${cart.totalPrice}",

                style:
                const TextStyle(

                  fontSize:21,

                  color:
                  Colors.green,

                  fontWeight:
                  FontWeight.bold,

                ),

              ),


            ],

          ),



        ],

      ),

    );

  }

}