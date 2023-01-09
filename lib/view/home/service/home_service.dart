import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qq_case/view/home/model/home_response_model.dart';
import 'package:qq_case/view/home/service/i_home_service.dart';

import '../../../core/init/network/network/service_helper.dart';
import '../../../core/utility/network_routes.dart';

class HomeService extends IHomeService with ServiceHelper {
  HomeService(Dio service) : super(service);

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
