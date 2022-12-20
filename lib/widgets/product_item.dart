import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(title,textAlign: TextAlign.center,),
          leading:  IconButton(icon: Icon(Icons.favorite),onPressed: (){},color: Theme.of(context).primaryColor, )  ,
          trailing: IconButton(icon:  Icon(Icons.shopping_cart),onPressed: (){},color: Theme.of(context).primaryColor, ),
        ),

        child: GestureDetector(child: Image.network(imageUrl,fit: BoxFit.cover,),onTap: (){
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: id);

        },),
      ),
    );
  }
}
