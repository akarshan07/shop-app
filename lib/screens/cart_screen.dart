import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';
import '../providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                      labelPadding: EdgeInsets.only(left: 10),
                      label: Text(cart.totalAmount.toStringAsFixed(2)),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text('\$'),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 9, vertical: 4)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'ORDER NOW',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
              itemBuilder: (ctx, index) => CartItem(
              id: cart.cartItem.values.toList()[index].id,
              title: cart.cartItem.values.toList()[index].title,
              price: cart.cartItem.values.toList()[index].price,
              quantity: cart.cartItem.values.toList()[index].quantity,
             ),
            itemCount: cart.quantity,
          ))
        ],
      ),
    );
  }
}
