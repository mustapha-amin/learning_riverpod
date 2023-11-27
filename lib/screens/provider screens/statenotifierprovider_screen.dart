import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/controllers/cartstart_notifier.dart';
import 'package:learning_riverpod/models/product.dart';
import 'package:learning_riverpod/screens/provider%20screens/cart_screen2.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products =
        ref.watch(cartStateNotifierProvider);
    int productCount = products.length;
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreenTwo(),
              ),
            ),
            child: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
                Badge(
                  textColor: Colors.white,
                  backgroundColor: Colors.red,
                  // padding: const EdgeInsets.all(20),
                  label: Text('$productCount'),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final Product product = productList[index];
                bool productInCart =
                    ref.watch(cartStateNotifierProvider.notifier).containsProduct(product);
                return ListTile(
                  title: Text(
                    product.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("\$${product.price}"),
                  trailing: IconButton(
                    onPressed: () {
                      productInCart
                          ? ref
                              .read(cartStateNotifierProvider.notifier)
                              .removeProduct(product)
                          : ref
                              .read(cartStateNotifierProvider.notifier)
                              .addProduct(product);
                    },
                    icon: Icon(
                      productInCart
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ref.read(cartStateNotifierProvider.notifier).clearCart();
                },
                child: const Text(
                  "Clear cart",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
