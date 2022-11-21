import 'package:chatapp/provider/products.dart';
import 'package:chatapp/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;
  ProductsGrid(this.showFavorites);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavorites ? productsData.itemsFavorites : productsData.items;
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        child: ProductItem(),
        value: products[index],
      ),
      padding: EdgeInsets.all(10),
    );
  }
}
