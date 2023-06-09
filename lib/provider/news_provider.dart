import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/news_api.dart';
import '../models/news_model.dart';

final newsProvider = FutureProvider<List<NewsModel>>((ref) {
  return ref.watch(newsApiServiceProvider).fetchNews();
});
