import 'package:dio/dio.dart';

abstract class ServiceHelper {
  final dio = Dio();

  dioGet(String path, Map<String, dynamic> query) async {
    final response = await dio.get(path, queryParameters: query);
    return response;
  }
}
