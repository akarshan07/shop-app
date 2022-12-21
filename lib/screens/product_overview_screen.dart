import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

enum filterOption{
  Favorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {

  bool _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop App'),
        actions: [
          PopupMenuButton(
            itemBuilder: (ctx)=>[
            PopupMenuItem(child: Text('Only Favorite'),value: filterOption.Favorite,),
            PopupMenuItem(child: Text('Show All'),value: filterOption.All,),
          ],
            icon: Icon(Icons.more_vert_rounded),
            onSelected: (filterOption selectedValue){

            setState(() {
              if(selectedValue == filterOption.Favorite){
                _showOnlyFavorite = true;
              }else{
                _showOnlyFavorite = false;
              }}
            );
            },
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorite),
    );
  }
}

