import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/models/product.dart';
import 'package:learning_riverpod/models/product_service.dart';

class CartStateNotifier extends StateNotifier<List<Product>> implements ProductService {
  CartStateNotifier() : super([]);
  
  @override
  void addProduct(Product product) {
    // TODO: implement addProduct
  }
  
  @override
  void clearCart() {
    // TODO: implement clearCart
  }
  
  @override
  bool containsProduct(Product product) {
    // TODO: implement containsProduct
    throw UnimplementedError();
  }
  
  @override
  void removeProduct(Product product) {
    // TODO: implement removeProduct
  }

  

}
