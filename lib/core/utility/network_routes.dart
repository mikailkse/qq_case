// ignore_for_file: constant_identifier_names

import '../constants/app/app_constants.dart';

enum NetworkRoutes {
  LOGIN,
}

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return AppConstants.BASEURL;

      default:
        throw Exception('Routes Not Found');
    }
  }
}
