import 'package:flutter/material.dart';
import 'package:learning_riverpod/screens/providers/provider_screen.dart';
import 'package:learning_riverpod/shared/provider_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod pracice"),
        actions: [
          Switch(
            value: false,
            onChanged: (_) {},
          ),
        ],
      ),
      body: const Column(
        children: [
          ProviderTile(
            title: "Provider",
            destination: ProviderScreen(),
          ),
        ],
      ),
    );
  }
}
