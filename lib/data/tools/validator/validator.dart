import 'dart:async';

import 'package:architecture/data/tools/custom_exception.dart';
import 'package:architecture/domain/entity/post_request/post_request_model.dart';



// import 'custom_exception.dart';

class Validator {
  // static StreamTransformer<String, String> isValidPhone() {
  //   return StreamTransformer<String, String>.fromHandlers(
  //       handleData: (request, sink) {
  //         var phone = request.trim();
  //         if (phone.length != 13) {
  //           sink.addError(NotValidException('login_phone_not_valid'));
  //           return;
  //         }
  //         sink.add(request);
  //       });
  // }
  static StreamTransformer<String, String> isValidPost() {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (request, sink) {
          var phone = request.trim();
          if (phone.length != 13) {
            sink.addError(NotValidException('login_phone_not_valid'));
            return;
          }
          sink.add(request);
        });
  }
  static StreamTransformer<PostRequest, PostRequest> isValidRequest() {
    return StreamTransformer<PostRequest, PostRequest>.fromHandlers(
        handleData: (request, sink) {

          if (request.title == null && request.body == null) {
            sink.addError(NotValidException('Body and Title is empty'));
            return;
          }
          sink.add(request);
        });
  }
}