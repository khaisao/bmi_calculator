import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static final String route = 'product_detail_screen';
  final Product product;
  ProductDetailScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(product.title)),);
  }
}
