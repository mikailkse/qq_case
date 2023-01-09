import 'package:dio/dio.dart';

import '../model/movie_detail_model.dart';

abstract class IMovieDetailService {
  final Dio service;

  IMovieDetailService(this.service);

  Future<MovieDetailModel> fetchMovieDetail(Map<String, dynamic> query, int id);
}
