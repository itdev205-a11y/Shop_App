import 'package:flutter/material.dart';
import '../Models/ModelProduct.dart';


class CartProvider extends ChangeNotifier {

  final List<ModelProduct> _cartProducts = [];

  final Map<ModelProduct, int> _quantities = {};


  List<ModelProduct> get cartProducts => _cartProducts;



  void addProduct(ModelProduct product) {

    if (_cartProducts.contains(product)) {

      _quantities[product] = _quantities[product]! + 1;

    } else {

      _cartProducts.add(product);

      _quantities[product] = 1;

    }

    notifyListeners();
  }



  int getQuantity(ModelProduct product) {

    return _quantities[product] ?? 1;

  }



  void increaseQuantity(ModelProduct product) {

    _quantities[product] =
        getQuantity(product) + 1;

    notifyListeners();

  }



  void decreaseQuantity(ModelProduct product) {

    if (getQuantity(product) > 1) {

      _quantities[product] =
          getQuantity(product) - 1;

      notifyListeners();

    }

  }



  void removeProduct(ModelProduct product) {

    _cartProducts.remove(product);

    _quantities.remove(product);

    notifyListeners();

  }



  double get totalPrice {

    double total = 0;


    for (var product in _cartProducts) {

      total += product.price *
          getQuantity(product);

    }


    return total;

  }


  void clearMyCart() {

    _cartProducts.clear();

    _quantities.clear();

    notifyListeners();

  }


}