import 'package:dio/dio.dart';

import '../model/home_response_model.dart';

abstract class IHomeService {
  final Dio service;

  IHomeService(this.service);

  Future<HomeResponseModel> fetchMovie(Map<String, dynamic> query);
}
