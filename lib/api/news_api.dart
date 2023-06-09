import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/const/ustils.dart';
import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  Future<List<NewsModel>> fetchNews() async {
    final response = await http.get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];
      return data.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  when({required Null Function(dynamic data) data}) {}
}

final newsApiServiceProvider = Provider<NewsApiService>((ref) {
  return NewsApiService();
});
