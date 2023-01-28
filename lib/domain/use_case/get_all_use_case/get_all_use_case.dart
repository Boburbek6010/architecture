import 'package:architecture/data/server/error_parser.dart';
import 'package:architecture/domain/entity/get_all/get_all_model.dart';
import 'package:architecture/domain/entity/result/result_model.dart';
import 'package:architecture/domain/repositories/app_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetAllUseCase {
  final AppRepository _repo;
  GetAllUseCase(this._repo);

  Stream<Result<List<GetAllResponse>>> invoke() => _repo.getAllTodos()
      .map((response) {
    return Result.content(response);
  }).onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
