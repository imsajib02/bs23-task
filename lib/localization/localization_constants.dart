import 'package:flutter/material.dart';

const String ENGLISH = 'en';
const String BANGLA = 'bn';

Locale getLocale(String languageCode) {

  Locale _locale;

  switch(languageCode) {

    case ENGLISH:
      _locale = Locale(languageCode, 'US');
      break;

    case BANGLA:
      _locale = Locale(languageCode, 'BD');
      break;

    default:
      _locale = Locale(ENGLISH, 'US');
  }

  return _locale;
}

const STR_APP_NAME = 'app_name';
const STR_OOPS = 'oops';
const STR_DATA_FAILURE = 'data_failure';
const STR_TRY_AGAIN = 'try_again';
const STR_NO_INTERNET = 'no_internet';
const STR_INACTIVE_CONNECTION = 'inactive_connection';
const STR_TIMED_OUT = 'timed_out';
const STR_UNKNOWN_ERROR = 'unknown_error';
const STR_FLUTTER_REPOS = 'flutter_repos';
const STR_NAME = 'name';
const STR_STAR = 'star';
const STR_OWNER = 'owner';