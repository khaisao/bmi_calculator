import 'package:chatapp/provider/products.dart';
import 'package:chatapp/screens/product_detail_screen.dart';
import 'package:chatapp/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Products(),
      child: MaterialApp(
        routes: {
          ProductOverviewScreen.route: (context) => ProductOverviewScreen(),
          ProductDetailScreen.route: (context) => ProductDetailScreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
      ),
    );
  }
}
