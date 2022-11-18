import 'package:chatapp/screens/product_detail_screen.dart';
import 'package:chatapp/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';

import 'model/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ProductOverviewScreen.route: (context) => ProductOverviewScreen(),
        ProductDetailScreen.route: (context) =>
            ProductDetailScreen(Product('', '', '', 0, '', false)),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Lato',
      ),
      home: ProductOverviewScreen(),
    );
  }
}
