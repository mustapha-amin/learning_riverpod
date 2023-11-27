import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/models/product.dart';
import 'package:learning_riverpod/models/product_service.dart';

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>(
  (ref) => CartNotifier(),
);

class CartNotifier extends ChangeNotifier implements ProductService{
  List<Product> cart = [];

  @override
  bool containsProduct(Product product) {
    return cart.contains(product);
  }

  @override
  void addProduct(Product product) {
    cart.add(product);
    notifyListeners();
  }

  @override
  void removeProduct(Product product) {
    cart.remove(product);
    notifyListeners();
  }

  @override
  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
