import 'package:flutter/material.dart';

import 'CategoryProductsScreen.dart';


class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});


  @override
  Widget build(BuildContext context) {


    final List<Map<String, dynamic>> categories = [

      {
        'name': 'Bags',
        'icon': Icons.shopping_bag,
      },

      {
        'name': 'Clothes',
        'icon': Icons.checkroom,
      },

      {
        'name': 'Accessories',
        'icon': Icons.diamond,
      },

      {
        'name': 'Shoes',
        'icon': Icons.shopping_cart,
      },

      {
        'name': 'Watches',
        'icon': Icons.watch,
      },

      {
        'name': 'Popular',
        'icon': Icons.star,
      },

    ];



    return Scaffold(

      backgroundColor: const Color(0xffF6F7FB),


      appBar: AppBar(

        title: const Text('All Categories'),

        backgroundColor: Colors.white,

        foregroundColor: Colors.black,

        elevation: 0,

        centerTitle: true,

      ),



      body: Padding(

        padding: const EdgeInsets.all(16),


        child: GridView.builder(


          itemCount: categories.length,


          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 2,

            crossAxisSpacing: 16,

            mainAxisSpacing: 16,

            childAspectRatio: 1,

          ),



          itemBuilder: (context,index){


            final category = categories[index];



            return GestureDetector(

              onTap: () {


                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (context) =>
                        CategoryProductsScreen(

                          category: category['name'],

                        ),

                  ),

                );


              },


              child: Card(

                elevation: 3,


                shape:
                RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(20),

                ),



                child: Column(

                  mainAxisAlignment:
                  MainAxisAlignment.center,


                  children: [


                    Container(

                      width: 70,

                      height: 70,

                      decoration: BoxDecoration(

                        color: Colors.grey.shade100,

                        shape: BoxShape.circle,

                      ),


                      child: Icon(

                        category['icon'],

                        size: 35,

                      ),

                    ),



                    const SizedBox(height: 15),



                    Text(

                      category['name'],

                      style: const TextStyle(

                        fontSize: 17,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),


                  ],

                ),

              ),

            );

          },

        ),

      ),

    );

  }

}