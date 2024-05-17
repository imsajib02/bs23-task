import 'package:get/get.dart';

import '../barrels/views.dart';

const String ROUTE_INITIAL = '/';
const String REPO_DETAILS = '/repo-details';

final appPages = [

  GetPage(name: ROUTE_INITIAL, page: () => Home()),
  GetPage(name: REPO_DETAILS, page: () => RepoDetails()),
];