
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_model.g.dart';

@JsonSerializable()
class GetAllResponse {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  GetAllResponse({this.userId, this.id, this.title, this.completed});

  factory GetAllResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllResponseToJson(this);
}