import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String id;
  final double price;
  final int quantity;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  void addToCart(
    String productId,
    String title,
    double price,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
            (existingCartProduct) => CartItem(
          id: existingCartProduct.id,
          title: existingCartProduct.title,
          price: existingCartProduct.price,
          quantity: existingCartProduct.quantity + 1,
        ),
      );
    } else {
      _cartItems.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, price: price, quantity: 1));
    }
    notifyListeners();
  }

  int get quantity{
    return _cartItems.length;
  }

}
