import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {

  final String title;
  final String id;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: CircleAvatar(child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: FittedBox(child: Text('\$$price'),),
          ),),
          title: Text(title),
          subtitle: Text('Total: ${(price*quantity)}'),
          trailing: Text('${quantity}x'),
        ),
      ),
    );
  }
}
