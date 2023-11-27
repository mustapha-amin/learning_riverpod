import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/models/product.dart';

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>(
  (ref) => CartNotifier(),
);

class CartNotifier extends ChangeNotifier {
  List<Product> cart = [];

  bool containsProduct(Product product) {
    return cart.contains(product);
  }

  void addProduct(Product product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
