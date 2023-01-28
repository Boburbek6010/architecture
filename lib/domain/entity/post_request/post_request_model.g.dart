// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequest _$PostRequestFromJson(Map<String, dynamic> json) => PostRequest(
      title: json['title'] as String?,
      body: json['body'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$PostRequestToJson(PostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
    };
