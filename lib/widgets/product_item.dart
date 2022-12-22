import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem({
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Product>(context,listen: false);
    final cart = Provider.of<Cart>(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(product.title,textAlign: TextAlign.center,),
          leading:  Consumer<Product>(
            builder: (ctx,product,child)=>IconButton(
              icon: product.isFavorite ? Icon(Icons.favorite): Icon(Icons.favorite_outline),
              onPressed: (){
                product.toggleFavorite();
              },
              color: Theme.of(context).primaryColor, ),
          )  ,
          trailing: IconButton(icon:  Icon(Icons.shopping_cart ),onPressed: (){
            cart.addToCart(product.id, product.title, product.price);
          },color: Theme.of(context).primaryColor, ),
        ),

        child: GestureDetector(child: Image.network(product.imageUrl,fit: BoxFit.cover,),onTap: (){
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id,
          );
        },
        ),
      ),
    );
  }
}
