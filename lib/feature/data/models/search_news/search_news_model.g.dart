// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchNewsModel _$SearchNewsModelFromJson(Map<String, dynamic> json) =>
    SearchNewsModel(
      status: json['status'] as String? ?? '',
      news: (json['news'] as List<dynamic>?)
              ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: json['page'] as int? ?? 0,
    );

Map<String, dynamic> _$SearchNewsModelToJson(SearchNewsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'news': instance.news,
      'page': instance.page,
    };
