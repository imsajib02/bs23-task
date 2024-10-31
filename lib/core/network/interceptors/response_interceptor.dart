import 'dart:io';

import 'package:get/get.dart' show Trans;
import 'package:http_interceptor/http_interceptor.dart';

import '../../constants/localization_constants.dart';
import '../../error/exceptions/app_exceptions.dart';

class ResponseInterceptor implements InterceptorContract {

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async => request;

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {

    if(response.statusCode != HttpStatus.ok && response.statusCode != HttpStatus.created && response.statusCode != HttpStatus.accepted) {
      throw NetworkException(strSomethingWrong.tr);
    }

    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async => false;

  @override
  Future<bool> shouldInterceptResponse() async => true;
}