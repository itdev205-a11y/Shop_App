import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Provider_Favourite.dart';


class FavouriteScreen extends StatelessWidget {

  const FavouriteScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'Favourite',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

      ),

      body: Consumer<FavouriteProvider>(
        builder: (context, favouriteProvider, child) {

          final favorites =
              favouriteProvider.favorites;

          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,

                    size: 80,

                    color: Colors.grey.shade400,
                  ),

                  const SizedBox(height: 20),
                  Text(
                    'No Favourite Products',

                    style: TextStyle(

                      fontSize: 18,

                      color: Colors.grey.shade600,

                      fontWeight: FontWeight.w600,

                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(

            padding: const EdgeInsets.all(16),

            itemCount: favorites.length,

            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,

              crossAxisSpacing: 12,

              mainAxisSpacing: 12,

              childAspectRatio: 0.68,

            ),

            itemBuilder: (context,index){

              final product =
              favorites[index];

              return Container(

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(

                      color:
                      Colors.black.withOpacity(0.08),

                      blurRadius: 12,

                      offset:
                      const Offset(0,5),

                    ),
                  ],
                ),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Expanded(
                      child: Stack(
                        children: [

                          ClipRRect(

                            borderRadius:
                            const BorderRadius.vertical(

                              top: Radius.circular(18),

                            ),

                            child: Image.network(
                              product.image,
                              width:
                              double.infinity,

                              fit:
                              BoxFit.cover,

                            ),
                          ),

                          Positioned(

                            top: 8,

                            right: 8,

                            child: CircleAvatar(

                              radius: 18,

                              backgroundColor:
                              Colors.white,

                              child: IconButton(

                                padding:
                                EdgeInsets.zero,

                                onPressed: () {

                                  favouriteProvider
                                      .toggleFavorite(
                                    product,
                                  );
                                },
                                icon: const Icon(

                                  Icons.favorite,

                                  size: 20,

                                  color: Colors.red,

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(

                      padding:
                      const EdgeInsets.all(10),

                      child: Text(
                        product.name,

                        maxLines: 1,

                        overflow:
                        TextOverflow.ellipsis,

                        style:
                        const TextStyle(
                          fontWeight:
                          FontWeight.bold,
                          fontSize: 15
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
                        style:
                        const TextStyle(

                          color:
                          Colors.green,

                          fontSize: 16,

                          fontWeight:
                          FontWeight.bold,

                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}