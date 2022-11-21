import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product.providers(
        'p1',
        'Read Shirt',
        'A red shirt - it is pretty red!',
        29.99,
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        false),
    Product.providers(
        'p2',
        'Reaaaad Shirt',
        'A red shirt - it is pretty red!',
        29.99,
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        false),
    Product.providers(
        'p3',
        'Red Shirt',
        'A red shirt - it is pretty red!',
        29.99,
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        false),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get itemsFavorites {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct() {}
}
