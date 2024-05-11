// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_news_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopNewsModels _$TopNewsModelsFromJson(Map<String, dynamic> json) =>
    TopNewsModels(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopNewsModelsToJson(TopNewsModels instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
