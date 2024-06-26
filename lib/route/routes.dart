import 'package:get/get.dart';

import '../barrels/pages.dart';

const String ROUTE_LOGIN = '/login';
const String ROUTE_SIGNUP = '/signup';
const String ROUTE_HOME = '/home';

final appPages = <GetPage>[

  GetPage(name: ROUTE_LOGIN, page: () => Login()),
  GetPage(name: ROUTE_SIGNUP, page: () => Signup()),
  GetPage(name: ROUTE_HOME, page: () => Home()),
];