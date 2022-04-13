import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<Map<String, dynamic>>> readJsonList(String path) async {
  final content = await rootBundle.loadString(path, cache: false);
  final list = json.decode(content) as List<dynamic>;
  return list.map((e) => e as Map<String, dynamic>).toList();
}
