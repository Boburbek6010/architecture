
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_request_model.g.dart';

@JsonSerializable()
class PostRequest {

  String? title;
  String? body;
  int? userId;

  PostRequest({this.title, this.body, this.userId});

  factory PostRequest.fromJson(Map<String, dynamic> json) =>
      _$PostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostRequestToJson(this);
}