import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';
import '../providers/orders.dart';
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
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                      labelPadding: const EdgeInsets.only(left: 10),
                      label: Text(cart.totalAmount.toStringAsFixed(2)),
                      avatar: const CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text('\$'),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4)),
                  TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context,listen: false).addOrderItem(cart.totalAmount, cart.cartItem.values.toList());
                        cart.clear();
                      },
                      child: const Text(
                        'ORDER NOW',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
              itemBuilder: (ctx, index) => CartItem(
              id: cart.cartItem.values.toList()[index].id,
              productId: cart.cartItem.keys.toList()[index],
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
