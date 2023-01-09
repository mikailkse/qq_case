import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qq_case/core/common/viewmodel/common_view_model.dart';
import 'package:qq_case/view/movie_detail/service/movie_detail_service.dart';

import '../../../core/utility/network_routes.dart';
import '../model/movie_detail_model.dart';
import '../model/movie_detail_query_model.dart';

class MovieDetailViewModel extends BaseViewModel {
  MovieDetailService? movieDetailService;

  movieDetailServiceInitState() {
    movieDetailService = MovieDetailService(
      Dio(
        BaseOptions(baseUrl: NetworkRoutes.BASE_URL.route),
      ),
    );
    notifyListeners();
  }

  MovieDetailModel movieDetailModel = MovieDetailModel();

  Future<void> fetchMovieDetail(int index) async {
    changeIsLoading();
    movieDetailModel = await movieDetailService!.fetchMovieDetail(
        DetailMovieQueryModel(apiKey: dotenv.env['API_KEY']).toJson(), index);
    changeIsLoading();
  }
}
