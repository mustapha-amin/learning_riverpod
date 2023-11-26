import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: Home(),
      ),
    ),
  );
}
