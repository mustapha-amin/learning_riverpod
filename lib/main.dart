import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(isDarkMode);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
