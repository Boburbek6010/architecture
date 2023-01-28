
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_response_model.g.dart';

@JsonSerializable()
class PostResponse {
  int? id;
  String? title;
  String? body;
  int? userId;

  PostResponse({this.id, this.title, this.body, this.userId});

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}