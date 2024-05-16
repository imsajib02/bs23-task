import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../barrels/localizations.dart';
import '../barrels/utils.dart';

class HomeRepository {

  Future<http.Response> getList() async {

    var result = await Connectivity().checkConnectivity();

    if(result != ConnectivityResult.mobile && result != ConnectivityResult.wifi)
      throw NoInternetException(message: STR_NO_INTERNET.tr);

    var networkStatus = await InternetConnectionChecker().isHostReachable(options);

    if(!networkStatus.isSuccess)
      throw BadConnectionException(message: STR_INACTIVE_CONNECTION.tr);

    var client = http.Client();

    String url = dotenv.env['API_URL']! + dotenv.env['PRODUCTS']!;

    try {
      var response = await client.get(Uri.parse(url),
        headers: {'Accept' : 'application/json'},
      ).timeout(Duration(seconds: timeoutSeconds));

      print(response.body);

      client.close();
      return response;

    } on TimeoutException {

      client.close();
      throw ConnectionTimedOutException(message: STR_TIMED_OUT.tr);

    } catch(error) {

      client.close();
      throw BadRequestException(message: STR_UNKNOWN_ERROR.tr);
    }
  }
}