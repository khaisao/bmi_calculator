import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem(this.id, this.title, this.quantity, this.price);
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items;
  Map<String, CartItem> get items {
    return {...?_items};
  }

  int get itemCount {
    if (_items?.isEmpty) {
      return 0;
    } else {
      return _items?.length;
    }
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCardItem) => CartItem(
              existingCardItem.id,
              existingCardItem.title,
              existingCardItem.quantity,
              existingCardItem.price));
    } else {
      _items.putIfAbsent(productId,
          () => CartItem(DateTime.now().toString(), title, 1, price));
    }
    notifyListeners();
  }
}
