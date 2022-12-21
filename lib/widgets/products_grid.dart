import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final products =  Provider.of<Products>(context);
    final productsData = products.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider(
        create: (c)=> productsData[index],
        child: ProductItem(
          // id: productsData[index].id,
          // title: productsData[index].title,
          // imageUrl: productsData[index].imageUrl,
        ),
      ),
      itemCount: productsData.length,
    );
  }
}
