import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './providers/cart.dart';
import 'package:provider/provider.dart';
import './screens/product_overview_screen.dart';
import './screens/orders_screen.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/user_product_screen.dart';
import './providers/products.dart';
import './providers/orders.dart';

void main(){
runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]
    );
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (ctx)=> Products(),),
        ChangeNotifierProvider(
          create: (ctx)=> Cart(),),
        ChangeNotifierProvider(
          create: (ctx)=>Orders(),),
    ],
      child: MaterialApp(
        title: 'My Shop App',
        theme: ThemeData(
          //appBarTheme: AppBarTheme(color: Colors.purple),
          primaryColor: Colors.deepOrange,
          primarySwatch: Colors.purple,
          chipTheme: ChipThemeData(backgroundColor: Colors.purple.shade500,labelStyle: const TextStyle(color: Colors.white)),
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName : (ctx)=>ProductDetailScreen(),
          CartScreen.routeName: (ctx)=> CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
        },
      ),
    );
  }
}
