import 'package:dio/dio.dart';
import 'package:qq_case/view/home/service/home_service.dart';

import '../../../core/common/viewmodel/common_view_model.dart';
import '../../../core/utility/network_routes.dart';
import '../model/home_response_model.dart';
import '../model/query_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeService? service;

  HomeResponseModel data = HomeResponseModel();

  List<Results> movieResultsArray = [];

  homeServiceInitState() {
    service = HomeService(
      Dio(
        BaseOptions(baseUrl: NetworkRoutes.BASE_URL.route),
      ),
    );
    fetchDatas();
    notifyListeners();
  }

  Future<void> fetchDatas() async {
    changeIsLoading();
    data = await service!.fetchMovie(
      QueryModel(
              apiKey: 'e55b37b0c66c63bca665a7728ca876ca', query: 'a', page: 1)
          .toJson(),
    );
    movieResultsArray = data.results ?? [];
    changeIsLoading();
  }
}
