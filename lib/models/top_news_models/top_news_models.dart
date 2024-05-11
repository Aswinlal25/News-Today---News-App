import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'top_news_models.g.dart';

@JsonSerializable()
class TopNewsModels {
  String? status;
  int? totalResults;
  List<Article>? articles;

  TopNewsModels({this.status, this.totalResults, this.articles});

  factory TopNewsModels.fromJson(Map<String, dynamic> json) {
    return _$TopNewsModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopNewsModelsToJson(this);
}
