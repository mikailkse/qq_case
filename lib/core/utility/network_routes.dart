// ignore_for_file: constant_identifier_names

import '../constants/app/app_constants.dart';

enum NetworkRoutes {
  PHOTO_URL(AppContants.PHOTO_URL),
  BASE_URL(AppContants.API_URL),
  GET_MOVIE('/search/movie?'),
  GET_MOVIE_DETAIL('/movie/');

  final String route;

  const NetworkRoutes(this.route);

  String withBaseUrl() {
    return BASE_URL.route + route;
  }

  String withMovieDetailPath(int number) {
    return GET_MOVIE_DETAIL.route + number.toString();
  }
}
