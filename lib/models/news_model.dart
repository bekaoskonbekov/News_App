import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? content;

  NewsModel(
      {this.author = '',
      this.title = '',
      this.description = '',
      this.urlToImage = '',
      this.content = ''});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
