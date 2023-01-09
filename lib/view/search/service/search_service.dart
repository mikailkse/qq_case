import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qq_case/view/search/service/i_search_service.dart';

import '../../../core/init/network/network/service_helper.dart';
import '../../../core/utility/network_routes.dart';
import '../model/home_response_model.dart';

class SearchService extends ISearchService with ServiceHelper {
  SearchService(Dio service) : super(service);

  @override
  Future<HomeResponseModel> fetchMovie(Map<String, dynamic> query) async {
    final response = await service.get(NetworkRoutes.GET_MOVIE.withBaseUrl(),
        queryParameters: query);
    if (response.statusCode == HttpStatus.ok) {
      inspect(response);
      final responseData = response.data;
      HomeResponseModel parseData = HomeResponseModel.fromJson(responseData);
      return parseData;
    } else {
      return HomeResponseModel();
    }
  }
}
