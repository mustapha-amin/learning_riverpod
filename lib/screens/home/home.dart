import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/screens/provider%20screens/notifier_provider_screen.dart';
import 'package:learning_riverpod/screens/provider%20screens/provider_screen.dart';
import 'package:learning_riverpod/screens/provider%20screens/changenotifer_provider_screen.dart';
import 'package:learning_riverpod/screens/provider%20screens/statenotifierprovider_screen.dart';
import 'package:learning_riverpod/shared/provider_tile.dart';
import 'package:learning_riverpod/screens/provider%20screens/state_provider_screen.dart';

import '../provider screens/future_provider_screen.dart';
import '../provider screens/stream_provider_screen.dart';

StateProvider<bool> isDarkMode = StateProvider((ref) => false);

class Home extends ConsumerWidget {
  const Home({super.key});

  void toggleTheme(WidgetRef ref) {
    ref.read(isDarkMode.notifier).state = !ref.watch(isDarkMode);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Riverpod practice",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Switch(
            value: ref.watch(isDarkMode),
            onChanged: (_) {
              toggleTheme(ref);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ProviderTile(
              title: "Provider ${ref.watch(valueProvider)}",
              destination: const ProviderScreen(),
            ),
            ProviderTile(
              title: "State Provider ${ref.watch(stateProvider)}",
              destination: const StateProviderScreen(),
            ),
            // ignore: prefer_const_constructors
            ProviderTile(
              title: "Future Provider",
              destination: const FutureProviderScreen(),
            ),
            // ignore: prefer_const_constructors
            ProviderTile(
              title: "Stream Provider",
              destination: const StreamProviderScreen(),
            ),
            // ignore: prefer_const_constructors
            ProviderTile(
              title: "ChangeNotifier Provider",
              destination: const ChangeNotifierProviderScreen(),
            ),
            // ignore: prefer_const_constructors
            ProviderTile(
              title: "StateNotifier Provider",
              destination: const StateNotifierProviderScreen(),
            ),
            ProviderTile(
              title: "Notifier Provider",
              destination: const NotifierProviderScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
