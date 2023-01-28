import 'package:architecture/data/tools/log_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../tools/custom_exception.dart';

class ErrorParser {
  static String parse(error) {
    if (kDebugMode) {
      LogService.e(error.toString());
    }
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.response:
              var errorBody = error.response?.data['result'];
              if (errorBody != null) {
                return errorBody;
              }
              return 'bad_request_status_code ${error.response?.statusCode}';
            default:
              return 'oops_weak_internet_check_your_network_connection';
          }
        }
        if (error is NotValidException) {
          return error.message;
        }
        return error.toString();
      } on FormatException catch (e) {
        LogService.e("Error parser $e");
        return 'Ошибка типа формата';
      } catch (e) {
        LogService.e("Error parser catch $e");
        return 'Неожиданная ошибка';
      }
    }
    return error.toString().contains("is not a subtype of") ? 'Невозможно обработать' : 'Неожиданная ошибка';
  }
}