import 'package:chatapp/widgets/badge.dart';
import 'package:chatapp/widgets/products_grid.dart';
import 'package:flutter/material.dart';

enum FilterOption { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  static final String route = 'product_overview_screen';

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              print(value);
              // if(value==)
              setState(() {
                if (value == FilterOption.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only favorites'),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOption.All,
              ),
            ],
          ),
          Badge(IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
              2.toString(), Colors.redAccent),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
