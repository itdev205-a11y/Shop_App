import 'package:flutter/material.dart';

import '../Models/ModelProduct.dart';
import '../Widgets/Widgets_DetailProduct/Favourite_Button.dart';
import '../Widgets/Widgets_DetailProduct/Cart_Button.dart';
import '../Screens/DetailProduct_Screen.dart';
import '../DataBase/products_data.dart';


class CategoryProductsScreen extends StatelessWidget {

  final String category;

  const CategoryProductsScreen({
    super.key,
    required this.category,
  });


  @override
  Widget build(BuildContext context) {


    final List<ModelProduct> products = allProducts
        .where((product) => product.category == category)
        .toList();


    return Padding(
      padding: const EdgeInsets.all(1),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [


          Text(
            category,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),


          const SizedBox(height: 20),


          GridView.builder(

            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            itemCount: products.length,


            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,

              crossAxisSpacing: 15,

              mainAxisSpacing: 15,

              childAspectRatio: 0.62,

            ),


            itemBuilder: (context,index){


              final product = products[index];


              return InkWell(

                borderRadius: BorderRadius.circular(22),

                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(
                        product: product,
                      ),
                    ),
                  );

                },


                child: Container(

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(22),


                    boxShadow: [

                      BoxShadow(

                        color: Colors.black.withOpacity(0.08),

                        blurRadius: 15,

                        offset:
                        const Offset(0,6),

                      ),

                    ],

                  ),



                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,


                    children: [


                      Stack(

                        children: [


                          ClipRRect(

                            borderRadius:
                            const BorderRadius.vertical(
                              top: Radius.circular(22),
                            ),


                            child: Hero(

                              tag: product.image,


                              child: Image.network(

                                product.image,

                                height: 180,

                                width: double.infinity,

                                fit: BoxFit.cover,

                              ),

                            ),

                          ),



                          Positioned(

                            right: 10,

                            top: 10,


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


                              child: FavouriteButton(
                                product: product,
                              ),

                            ),

                          ),


                        ],

                      ),




                      Padding(

                        padding:
                        const EdgeInsets.all(12),


                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,


                          children: [


                            Text(

                              product.name,


                              maxLines: 1,


                              overflow:
                              TextOverflow.ellipsis,


                              style: const TextStyle(

                                fontSize: 17,

                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),










                            const SizedBox(height: 10),




                            Row(

                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,


                              children: [



                                Text(

                                  "\$${product.price}",


                                  style: const TextStyle(

                                    color: Colors.green,

                                    fontSize: 19,

                                    fontWeight:
                                    FontWeight.bold,

                                  ),

                                ),



                                CartButton(
                                  product: product,
                                ),


                              ],

                            )


                          ],

                        ),

                      )


                    ],

                  ),


                ),

              );


            },

          )


        ],

      ),

    );

  }

}