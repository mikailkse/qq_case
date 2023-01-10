import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qq_case/core/utility/network_routes.dart';
import 'package:qq_case/view/movie_detail/service/movie_detail_service.dart';
import 'package:qq_case/view/search/model/query_model.dart';

void main() {
  MovieDetailService? movieDetailService;
  setUp(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: '.env');
      movieDetailService = MovieDetailService(
        Dio(
          BaseOptions(baseUrl: NetworkRoutes.BASE_URL.route),
        ),
      );
    },
  );

  test('Movie Detail Service', () async {
    int movieId = 22;
    final response = await movieDetailService!.fetchMovieDetail(
        QueryModel(
          apiKey: dotenv.env['API_KEY'],
        ).toJson(),
        movieId);
    expect(response.overview!.isNotEmpty, true);
  });
}
