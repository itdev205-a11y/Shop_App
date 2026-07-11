import 'package:flutter/material.dart';
import 'package:store_app/Models/ModelProduct.dart';

import '../Screens/Detail_Screen.dart';


class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});


  @override
  Widget build(BuildContext context) {


    List<ModelProduct> products = [

      ModelProduct(
        name: 'Nike Shoes',
        price: 120,
        image:
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
        subscribe: 'New',
      ),


      ModelProduct(
        name: 'Leather Bag',
        price: 80,
        image:
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
        subscribe: 'Popular',
      ),


      ModelProduct(
        name: 'Watch',
        price: 150,
        image:
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
        subscribe: 'Sale',
      ),


      ModelProduct(
        name: 'Headphone',
        price: 90,
        image:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
        subscribe: 'New',
      ),

    ];



    return GridView.builder(

      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),


      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 2,

        crossAxisSpacing: 10,

        mainAxisSpacing: 10,

        childAspectRatio: 0.70,

      ),



      itemCount: products.length,



      itemBuilder: (context,index){


        final product = products[index];



        return GestureDetector(

          onTap: (){

            Navigator.push(

              context,

              MaterialPageRoute(

                builder: (context)=> DetailScreen(

                  product: product, products: [],

                ),

              ),

            );

          },



          child: Card(

            elevation: 4,


            shape: RoundedRectangleBorder(

              borderRadius:
              BorderRadius.circular(16),

            ),



            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,


              children: [


                Expanded(

                  child: ClipRRect(

                    borderRadius:
                    const BorderRadius.vertical(

                      top: Radius.circular(16),

                    ),


                    child: Image.network(

                      product.image,

                      width: double.infinity,

                      fit: BoxFit.cover,


                      errorBuilder:
                          (context,error,stackTrace){

                        return const Center(

                          child: Icon(
                            Icons.image_not_supported,
                          ),

                        );

                      },

                    ),

                  ),

                ),



                Padding(

                  padding:
                  const EdgeInsets.all(10),


                  child: Text(

                    product.name,


                    style: const TextStyle(

                      fontSize: 16,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                ),




                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,


                  children: [


                    Text(

                      '\$${product.price}',


                      style: const TextStyle(

                        fontSize: 16,

                        fontWeight:
                        FontWeight.bold,

                        color: Colors.green,

                      ),

                    ),



                    IconButton(

                      onPressed: (){},

                      icon: const Icon(

                        Icons.favorite_outline,

                      ),

                    ),


                  ],

                ),


              ],

            ),

          ),

        );

      },

    );

  }
}