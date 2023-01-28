// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllResponse _$GetAllResponseFromJson(Map<String, dynamic> json) =>
    GetAllResponse(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$GetAllResponseToJson(GetAllResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
