import 'package:flutter/material.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main(){
runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
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
    );
  }
}
