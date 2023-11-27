import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/controllers/cart_notifier.dart';
import 'package:learning_riverpod/models/product.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> productsInCart = ref.watch(cartNotifierProvider).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: productsInCart.isEmpty
          ? const Center(
              child: Text(
                "Cart is empty",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : ListView(
              children: [
                ...productsInCart.map(
                  (product) => ListTile(
                    title: Text(
                      product.name!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('\$${product.price}'),
                  ),
                )
              ],
            ),
    );
  }
}
