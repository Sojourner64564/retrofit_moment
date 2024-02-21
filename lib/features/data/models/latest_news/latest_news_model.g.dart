// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestNewsModel _$LatestNewsModelFromJson(Map<String, dynamic> json) =>
    LatestNewsModel(
      status: json['status'] as String? ?? '',
      news: (json['news'] as List<dynamic>?)
              ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LatestNewsModelToJson(LatestNewsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'news': instance.news,
    };
