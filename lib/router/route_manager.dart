import 'package:get/route_manager.dart';

import '../screen/home_page.dart';

class RouteManagement {
  static const String initialRoute = '/userPage';
  static List<GetPage> routeList = appRoute();
}

appRoute() => [
      GetPage(
          name: '/userPage',
          page: () => const UsersPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
    ];
