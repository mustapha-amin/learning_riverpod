import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/services/stream_service.dart';

final streamServiceStreamProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamServiceStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream provider"),
      ),
      body: Center(
          child: streamValue.when(
        data: (data) => Text(
          '$data',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        error: (_, __) => const Text("An error occured"),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
