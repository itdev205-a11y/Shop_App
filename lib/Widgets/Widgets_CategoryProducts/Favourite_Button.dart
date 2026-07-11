import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ModelProduct.dart';
import '../../Providers/Provider_Favourite.dart';


class FavouriteButton extends StatelessWidget {

  final ModelProduct product;


  const FavouriteButton({
    super.key,
    required this.product,
  });


  @override
  Widget build(BuildContext context) {

    final favouriteProvider =
    Provider.of<FavouriteProvider>(context);


    final isFavorite =
    favouriteProvider.isFavorite(product);



    return IconButton(

      onPressed: () {

        favouriteProvider.toggleFavorite(product);

      },


      icon: Icon(

        isFavorite
            ? Icons.favorite
            : Icons.favorite_outline,

        color: Colors.red,

      ),

    );

  }
}