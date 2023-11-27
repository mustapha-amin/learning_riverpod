import 'product.dart';

abstract class ProductService {
  bool containsProduct(Product product);

  void addProduct(Product product);

  void removeProduct(Product product);

  void clearCart();
}
