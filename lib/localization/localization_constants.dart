import 'package:flutter/material.dart';

import '../barrels/utils.dart';

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

List<Locale> get supportedLocales => [
  Locale(ENGLISH, 'US'),
  Locale(BANGLA, 'BD'),
];