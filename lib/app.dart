import 'package:flutter/material.dart';
import 'package:qq_case/core/theme/theme.dart';
import 'package:qq_case/view/_bottom_navbar/view/bottom_navbar.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QQ Case',
      theme: dark,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const BottomNavbar(),
    );
  }
}
