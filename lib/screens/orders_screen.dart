import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;

class OrderScreen extends StatefulWidget {

  static const routeName = '/order-screen';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Provider.of<Orders>(context,listen: false).fectchAndSetOrders().then((_) => _isLoading = false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final order = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Yours Order'),),
      drawer: AppDrawer(),
      body: _isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (ctx,index)=> OrderItem(order: order.items[index]),
        itemCount: order.items.length,
      ),
    );
  }
}
