import 'package:architecture/domain/entity/get_all/get_all_model.dart';
import 'package:architecture/domain/entity/post_request/post_request_model.dart';
import 'package:architecture/domain/entity/post_response/post_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../auth_interseptor.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService{
  factory ApiService(AuthInterceptor authInterceptor) {
    var options = BaseOptions(
      connectTimeout: ApiConst.connectionTimeout,
      sendTimeout: ApiConst.sendTimeout,
      baseUrl: ApiConst.baseUrl,
      headers: ApiConst.headers,
    );
    Dio dio = Dio(options);
    dio.interceptors
      ..add(authInterceptor)
      ..add(LogInterceptor(requestBody: true, responseBody: true));

    return _ApiService(dio);
  }
  @GET(ApiConst.getAll)
  Stream<List<GetAllResponse>> getAllTodos();

  @POST(ApiConst.pushPost)
  Stream<PostResponse> pushPost(@Body() PostRequest request);
}