import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/models/suggestion.dart';
import 'package:learning_riverpod/services/http_service.dart';
import 'package:learning_riverpod/shared/suggesion_card.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose<Suggestion>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion();
});

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Provider"),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(suggestionFutureProvider.future),
        child: ListView(
          children: [
            Center(
              child: suggestionRef.when(
                data: (data) => SuggestionCard(suggestion: data),
                error: (error, __) => Text("An error occured: $error"),
                loading: () => const CircularProgressIndicator(),      
              ),
            ),
          ],
        ),
      ),
    );
  }
}
