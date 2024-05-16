import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

const int timeoutSeconds = 40;

final AddressCheckOptions options = AddressCheckOptions(InternetAddress('8.8.8.8'), port: 53, timeout: Duration(seconds: 2));