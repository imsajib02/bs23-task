import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

String? parseError(Response? response) {

  if(response == null) return null;

  try {
    var data = json.decode(response.body);

    if(data == null || data['errors'] == null ? (data['status'] == null || data['message'] == null) : false) return null;

    if(data['status'] != null && !data['status'] && data['message'] is String) {
      return data['message'];
    }

    if(data['status'] != null && !data['status'] && data['message'] is Map) {
      var keys = (data['message'] as Map<String, dynamic>).keys;

      if(keys.isNotEmpty && data['message'][keys.first] is List && data['message'][keys.first].isNotEmpty) {
        return data['message'][keys.first][0].toString();
      }
    }

    if(data['errors'] != null && data['errors'] is Map) {
      var keys = (data['errors'] as Map<String, dynamic>).keys;

      if(keys.isNotEmpty && data['errors'][keys.first] is List && data['errors'][keys.first].isNotEmpty) {
        return data['errors'][keys.first][0].toString();
      }
    }
  }
  catch(error) {
    return null;
  }

  return null;
}