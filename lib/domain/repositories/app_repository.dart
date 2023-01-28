import 'package:architecture/domain/entity/get_all/get_all_model.dart';
import 'package:architecture/domain/entity/post_request/post_request_model.dart';
import 'package:architecture/domain/entity/post_response/post_response_model.dart';

abstract class AppRepository{
  Stream<List<GetAllResponse>> getAllTodos();
  Stream<PostResponse> pushPost(PostRequest request);

}