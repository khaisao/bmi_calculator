import 'package:chatapp/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  static final String route = 'product_overview_screen';
  List<Product> loaderProduct = [
    Product(
        'p1',
        'Red Shirt',
        'A red shirt - it is pretty red!',
        29.99,
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        false),
    Product(
        'p1',
        'Red Shirt',
        'A red shirt - it is pretty red!',
        29.99,
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        false),
    Product(
        'p1',
        'Red Shirt',
        'A red shirt - it is pretty red!',
        29.99,
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: GridView.builder(
        itemCount: loaderProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ProductItem(loaderProduct[index]);
        },
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
