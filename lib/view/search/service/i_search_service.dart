import 'package:dio/dio.dart';

import '../model/home_response_model.dart';

abstract class ISearchService {
  final Dio service;

  ISearchService(this.service);

  Future<HomeResponseModel> fetchMovie(Map<String, dynamic> query);
}
