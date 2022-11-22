import 'package:chatapp/provider/product.dart';
import 'package:chatapp/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Product>(
      builder: (context, value, child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailScreen.route,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border)),
            title: Text(product.title, textAlign: TextAlign.center),
            trailing: IconButton(
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title);
                },
                icon: Icon(Icons.shopping_cart)),
          ),
        ),
      ),
    );
  }
}
