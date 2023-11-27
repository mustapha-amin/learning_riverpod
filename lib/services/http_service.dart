import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/suggestion.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Suggestion> getSuggestion() async {
    try {
      final result = await Dio().get("https://www.boredapi.com/api/activity");
      return Suggestion.fromJson(result.data);
    } catch (e) {
      throw Exception("An error occured: $e");
    }
  }
}
