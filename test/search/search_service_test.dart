import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qq_case/core/utility/network_routes.dart';
import 'package:qq_case/view/search/model/query_model.dart';
import 'package:qq_case/view/search/service/search_service.dart';

void main() {
  SearchService? searchService;
  setUp(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: '.env');
      searchService = SearchService(
        Dio(
          BaseOptions(baseUrl: NetworkRoutes.BASE_URL.route),
        ),
      );
    },
  );

  test('Search Service', () async {
    final response = await searchService!.fetchMovie(
      QueryModel(apiKey: dotenv.env['API_KEY'], query: 'Venom', page: 1)
          .toJson(),
    );
    expect(response.results?.isNotEmpty, true);
  });
}
