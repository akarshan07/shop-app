import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import '../providers/products.dart';
import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName = '/userProduct-Screen';

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          }, icon: Icon(Icons.add)),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx,index) => Column(
            children: [
              UserProductItem(
                id: productData.items[index].id,
                title: productData.items[index].title,
                imageUrl: productData.items[index].imageUrl,
              ),
              const Divider(),
            ],
          ),
          itemCount: productData.items.length,),
      ),
    );
  }
}
