import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/init/network/network/service_helper.dart';
import '../../../core/utility/network_routes.dart';
import '../model/movie_detail_model.dart';
import 'i_movie_detail_service.dart';

class MovieDetailService extends IMovieDetailService with ServiceHelper {
  MovieDetailService(Dio service) : super(service);

  @override
  Future<MovieDetailModel> fetchMovieDetail(
      Map<String, dynamic> query, int id) async {
    final response = await service.get(
        NetworkRoutes.GET_MOVIE_DETAIL.withMovieDetailPath(id),
        queryParameters: query);
    inspect(response.data);
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data;
      MovieDetailModel parseData = MovieDetailModel.fromJson(responseData);
      return parseData;
    } else {
      return MovieDetailModel();
    }
  }
}
