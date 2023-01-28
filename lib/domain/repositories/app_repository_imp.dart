import 'package:architecture/data/server/api/api_service.dart';
import 'package:architecture/domain/entity/get_all/get_all_model.dart';
import 'package:architecture/domain/entity/post_request/post_request_model.dart';
import 'package:architecture/domain/entity/post_response/post_response_model.dart';

import 'app_repository.dart';
class AppRepositoryImpl extends AppRepository {
  final ApiService _api;
  AppRepositoryImpl(this._api);

  @override
  Stream<List<GetAllResponse>> getAllTodos() => _api.getAllTodos();

  @override
  Stream<PostResponse> pushPost(PostRequest request) => _api.pushPost(request);


}
