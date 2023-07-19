import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'router/route_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'I Wallet Case App',
      initialRoute: RouteManagement.initialRoute,
      getPages: RouteManagement.routeList,
    );
  }
}
