import 'package:flutter/material.dart';
import '../Models/ModelProduct.dart';

class CartProvider extends ChangeNotifier {
  final List<ModelProduct> _cartProducts = [];

  List<ModelProduct> get cartProducts => _cartProducts;

  void addProduct(ModelProduct product) {
    _cartProducts.add(product);
    notifyListeners();
  }

  void removeProduct(ModelProduct product) {
    _cartProducts.remove(product);
    notifyListeners();
  }
}