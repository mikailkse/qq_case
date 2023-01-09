import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qq_case/core/common/viewmodel/common_view_model.dart';
import 'package:qq_case/view/_bottom_navbar/viewmodel/bottom_navbar_view_model.dart';
import 'package:qq_case/view/home/viewmodel/home_view_model.dart';
import 'package:qq_case/view/splash/viewmodel/splash_view_model.dart';

import 'app.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BaseViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavbarViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => SplashViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
          ),
        ],
        child: const MyApp(),
      ),
    );
