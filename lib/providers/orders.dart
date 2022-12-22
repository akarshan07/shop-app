import 'package:flutter/material.dart';
import '../providers/cart.dart';

class OrderItem{

  final String id;
  final DateTime dateTime;
  final double amount;
  final List<CartItem> cartItem;

  OrderItem({
    required this.id,
    required this.dateTime,
    required this.amount,
    required this.cartItem,
  });

}

class Orders with ChangeNotifier {

  List<OrderItem> _orders = [];

  List<OrderItem> get items{
    return [..._orders];
  }

  void addOrderItem(double amount, List<CartItem> cartItem){
    _orders.insert(0, OrderItem(id: DateTime.now().toString(), dateTime: DateTime.now(), amount: amount, cartItem: cartItem,));
    notifyListeners();
  }

}
