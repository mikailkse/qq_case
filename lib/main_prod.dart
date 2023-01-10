import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:qq_case/view/movie_detail/viewmodel/movie_detail_view_model.dart';
import 'package:qq_case/view/search/viewmodel/search_view_model.dart';
import 'package:qq_case/view/splash/viewmodel/splash_view_model.dart';

import 'app.dart';

import 'core/config/app_config.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  AppConfig.instance.setProdParameters();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
