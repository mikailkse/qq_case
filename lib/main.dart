import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'view/search/viewmodel/search_view_model.dart';
import 'view/splash/viewmodel/splash_view_model.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SplashViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchViewModel(),
          ),
        ],
        child: const MyApp(),
      ),
    );
