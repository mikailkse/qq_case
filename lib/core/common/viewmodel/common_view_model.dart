import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;

  changeIsLoading() {
    isLoading != isLoading;
    notifyListeners();
  }
}
