import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProvider = StateProvider<int>((ref) => 29);

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(stateProvider, (_, curr) {
      if (curr % 10 == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Divisible by 10"),
            duration: Duration(milliseconds: 500),
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider ${ref.watch(stateProvider)}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The value is ${ref.watch(stateProvider)}"),
            TextButton.icon(
              onPressed: () {
                ref.invalidate(stateProvider);
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(stateProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
