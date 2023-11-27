import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/models/product.dart';
import 'package:learning_riverpod/models/product_service.dart';

final cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>(
  (ref) => CartStateNotifier(),
);

class CartStateNotifier extends StateNotifier<List<Product>>
    implements ProductService {
  CartStateNotifier() : super([]);

  @override
  void addProduct(Product product) {
    state = [...state, product];
  }

  @override
  void clearCart() {
    state = [];
  }

  @override
  bool containsProduct(Product product) {
    return state.contains(product);
  }

  @override
  void removeProduct(Product product) {
    state = state.where((p) => product != p).toList();
  }
}
