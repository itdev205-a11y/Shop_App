import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Widgets/Widgets_DetailProduct/Select_Color.dart';

import '../Models/ModelProduct.dart';
import '../Providers/CartProvider.dart';
import '../Screens/Cart_Screen.dart';
import '../Widgets/Widgets_DetailProduct/Favourite_Button.dart';
import '../Widgets/Widgets_DetailProduct/Cart_Button.dart';
import '../Widgets/Widgets_DetailProduct/Select_Size.dart';


class DetailScreen extends StatelessWidget {

  final ModelProduct product;

  const DetailScreen({
    super.key,
    required this.product,
  });


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: const Color(0xffF7F7F7),


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
                      bottom: Radius.circular(35),
                    ),

                    child: Image.network(

                      product.image,

                      height: 400,

                      width: double.infinity,

                      fit: BoxFit.cover,

                    ),

                  ),

                ),



                Positioned(

                  top: 15,

                  left: 15,

                  child: CircleAvatar(

                    backgroundColor: Colors.white,

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

                  child: CircleAvatar(

                    backgroundColor: Colors.white,

                    child: FavouriteButton(
                      product: product,
                    ),

                  ),

                ),




                Positioned(

                  bottom: 20,

                  right: 20,

                  child: CircleAvatar(

                    radius: 25,

                    backgroundColor: Colors.white,

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

                padding:
                const EdgeInsets.all(25),


                decoration: const BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),

                ),



                child: SingleChildScrollView(

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,


                    children: [



                      Row(

                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,


                        children: [


                          Expanded(

                            child: Text(

                              product.name,

                              maxLines: 2,

                              overflow:
                              TextOverflow.ellipsis,


                              style:
                              const TextStyle(

                                fontSize: 27,

                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),

                          ),



                          Container(

                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),

                            decoration:
                            BoxDecoration(

                              color:
                              Colors.amber.shade100,

                              borderRadius:
                              BorderRadius.circular(15),

                            ),


                            child: const Row(

                              children: [

                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),


                                SizedBox(width: 5),


                                Text(
                                  "4.5",
                                  style:
                                  TextStyle(
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),

                              ],

                            ),

                          ),


                        ],

                      ),




                      const SizedBox(height: 10),




                      Text(

                        "\$${product.price}",

                        style:
                        const TextStyle(

                          color: Colors.lightBlue,

                          fontSize: 28,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),




                      const SizedBox(height: 25),




                      const Text(

                        "Description",

                        style:
                        TextStyle(

                          fontSize: 20,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),




                      const SizedBox(height: 10),




                      Text(

                        "High quality product with modern design. "
                            "Perfect choice for your daily style.",


                        style:
                        TextStyle(

                          fontSize: 16,

                          color:
                          Colors.grey.shade700,

                          height: 1.6,

                        ),

                      ),




                      const SizedBox(height: 25),








                      const SizedBox(height: 10),



                      const SelectSize(),



                      const SizedBox(height: 10),
                      Divider(),
                      const SizedBox(height: 10),

                      SelectColor()



                    ],

                  ),

                ),

              ),

            ),


          ],

        ),

      ),



      bottomNavigationBar: Container(

        padding:
        const EdgeInsets.all(20),


        decoration:
        const BoxDecoration(

          color: Colors.white,

        ),


        child: SizedBox(

          height: 55,


          width: double.infinity,


          child: ElevatedButton(

            onPressed: () {


              context
                  .read<CartProvider>()
                  .addProduct(product);



              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                  const CartScreen(),

                ),

              );


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

              "Buy Now",

              style:
              TextStyle(

                color:
                Colors.white,

                fontSize: 19,

                fontWeight:
                FontWeight.bold,

              ),

            ),

          ),

        ),

      ),

    );

  }

}