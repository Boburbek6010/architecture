// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
    };
