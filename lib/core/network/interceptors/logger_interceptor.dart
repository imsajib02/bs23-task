import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../../utils/custom_log.dart';
import '../../utils/custom_trace.dart';

class LoggerInterceptor implements InterceptorContract {

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {

    if(kDebugMode) {
      log('\n<----------  Network Request  ---------->\n');
      log('Url: ${request.url.toString()}');
    }

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {

    if(response is Response) {
      _logResponse(response);
    }

    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async => true;

  @override
  Future<bool> shouldInterceptResponse() async => true;

  void _logResponse(Response? response) {

    if(kDebugMode && response != null) {
      log('Code: ${response.statusCode}');
      CustomLogger.debug(trace: CustomTrace(StackTrace.current), tag: 'Response', message: response.body);
    }
  }
}