import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) => 59);

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("The value is ${ref.watch(valueProvider)}"),
      ),
    );
  }
}
