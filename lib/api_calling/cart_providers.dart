import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:task_2/api_calling/modelclass.dart';

class CartItem {
  final ProductItem product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartNotifier extends ChangeNotifier {
  final List<CartItem> _items = [];

  var productResponse;

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      total += item.product.price! * item.quantity;
    }
    return total;
  }

  void addToCart(ProductItem product) {
    for (var item in _items) {
      if (item.product == product) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product));
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    _items.remove(cartItem);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

