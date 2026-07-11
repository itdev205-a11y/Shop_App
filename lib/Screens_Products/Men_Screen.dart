

import 'package:flutter/material.dart';

import '../Models/ModelProduct.dart';
import '../Screens/Detail_Screen.dart';


class MenScreen extends StatelessWidget {
  const MenScreen({super.key});


  @override
  Widget build(BuildContext context) {


    List<ModelProduct> menProducts = [

      ModelProduct(
        name: 'Men T-Shirt',
        price: 40,
        image:
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
        subscribe: 'Men Fashion',
      ),


      ModelProduct(
        name: 'Men Jacket',
        price: 120,
        image:
        'https://images.unsplash.com/photo-1591047139829-d91aecb6caea',
        subscribe: 'Winter',
      ),


      ModelProduct(
        name: 'Men Shoes',
        price: 100,
        image:
        'https://images.unsplash.com/photo-1495555961986-6d4c1ecb7be3',
        subscribe: 'Shoes',
      ),


      ModelProduct(
        name: 'Men Watch',
        price: 150,
        image:
        'https://images.unsplash.com/photo-1524805444758-089113d48a6d',
        subscribe: 'Accessories',
      ),

    ];



    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'Men Products',
        ),

      ),



      body: GridView.builder(

        padding: const EdgeInsets.all(16),


        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,

          crossAxisSpacing: 10,

          mainAxisSpacing: 10,

          childAspectRatio: 0.70,

        ),



        itemCount: menProducts.length,



        itemBuilder: (context,index){


          final product = menProducts[index];



          return GestureDetector(

            onTap: (){


              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context)=>
                      DetailScreen(

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

                      ),

                    ),

                  ),



                  Padding(

                    padding:
                    const EdgeInsets.all(10),


                    child: Text(

                      product.name,


                      style: const TextStyle(

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),

                  ),



                  Padding(

                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),


                    child: Text(

                      '\$${product.price}',


                      style: const TextStyle(

                        color: Colors.green,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),

                  ),



                  const SizedBox(height: 10),


                ],

              ),

            ),

          );


        },

      ),

    );

  }
}