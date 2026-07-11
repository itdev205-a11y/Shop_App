import 'package:flutter/material.dart';
import '../Models/ModelProduct.dart';


class FavouriteProvider with ChangeNotifier {

  final List<ModelProduct> _favorites = [];


  List<ModelProduct> get favorites => _favorites;



  void toggleFavorite(ModelProduct product) {

    if (_favorites.contains(product)) {

      _favorites.remove(product);

    } else {

      _favorites.add(product);

    }

    notifyListeners();

  }



  bool isFavorite(ModelProduct product) {

    return _favorites.contains(product);

  }

}