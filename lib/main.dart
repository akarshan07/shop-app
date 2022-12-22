import 'package:flutter/material.dart';
import './providers/cart.dart';
import 'package:provider/provider.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';

void main(){
runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (ctx)=> Products(),),
        ChangeNotifierProvider(
          create: (ctx)=> Cart(),),
    ],
      child: MaterialApp(
        title: 'My Shop App',
        theme: ThemeData(
          //appBarTheme: AppBarTheme(color: Colors.purple),
          primaryColor: Colors.deepOrange,
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName : (ctx)=>ProductDetailScreen(),
        },
      ),
    );
  }
}
