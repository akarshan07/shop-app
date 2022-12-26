import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;

class OrderScreen extends StatelessWidget {

  static const routeName = '/order-screen';
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text('Yours Order'),),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context,listen: false).fectchAndSetOrders(),
        builder: (ctx,dataSnapshot){
          if(dataSnapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
            if(dataSnapshot.error !=null){
              return Center(child: Text('An error occurred'),);
            }else{
              return Consumer<Orders>(
                builder:(ctx,order,child)=>ListView.builder(
                    itemBuilder: (ctx,index)=> OrderItem(order: order.items[index]),
                    itemCount: order.items.length
                ),

              );
            }
          }
        },
      )
    );
  }
}
