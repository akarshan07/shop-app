import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;

class OrderScreen extends StatelessWidget {

  static const routeName = '/order-screen';

  @override
  Widget build(BuildContext context) {

    final order = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Yours Order'),),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx,index)=> OrderItem(order: order.items[index]),
        itemCount: order.items.length,
      ),
    );
  }
}
