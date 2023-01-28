import 'package:architecture/data/server/error_parser.dart';
import 'package:architecture/data/tools/validator/validator.dart';
import 'package:architecture/domain/entity/post_request/post_request_model.dart';
import 'package:architecture/domain/entity/post_response/post_response_model.dart';
import 'package:architecture/domain/entity/result/result_model.dart';
import 'package:architecture/domain/repositories/app_repository.dart';
import 'package:rxdart/rxdart.dart';



class PushPostUseCase {
  final AppRepository _repo;
  PushPostUseCase(this._repo);

  Stream<Result<PostResponse>> invoke(PostRequest request) => Stream.value(request)
      .transform(Validator.isValidRequest()) //   Stream<LoginRequest>
      .flatMap((request) => _repo.pushPost(request))
      .map((response) => Result.content(response))
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
