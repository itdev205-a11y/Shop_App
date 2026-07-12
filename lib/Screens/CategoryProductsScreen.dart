import 'package:flutter/material.dart';
import 'package:store_app/Screens/DetailProduct_Screen.dart';
import '../Models/ModelProduct.dart';
import '../Widgets/Widgets_DetailProduct/Favourite_Button.dart';
import '../products_data.dart';



class CategoryProductsScreen extends StatelessWidget {

  final String category;


  const CategoryProductsScreen({

    super.key,

    required this.category,

  });



  @override
  Widget build(BuildContext context) {


    List<ModelProduct> products =

    allProducts.where(

          (product) => product.category == category,

    ).toList();



    return  Padding(

          padding: const EdgeInsets.all(5),


          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,


            children: [


              Text(

                category,
                style: const TextStyle(
                  fontSize: 24,
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
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.62,
                ),

                itemBuilder: (context,index){
                  final product = products[index];

                  return GestureDetector(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            product: product,
                          ),
                        ),
                      );
                    },

                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color:
                            Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset:
                            const Offset(0,5),
                            
                          ),
                        ],
                      ),
                      
                      child: Column(
                        
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        
                        children: [
                          
                          ClipRRect(
                            
                            borderRadius:
                            const BorderRadius.vertical(
                              
                              top: Radius.circular(20),
                            ),
                            
                            child: Image.network(
                              
                              product.image,
                              
                              height: 160,
                              
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
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
                                    
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.bold,
                                    
                                  ),
                                ),
                                
                                const SizedBox(height: 8),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      '\$${product.price}',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),


                                    FavouriteButton(
                                      product: product,

                                        )



                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

    );
  }
}