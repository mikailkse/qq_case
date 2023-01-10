import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qq_case/core/common/viewmodel/common_view_model.dart';
import 'package:qq_case/view/search/service/search_service.dart';

import '../../../core/init/debouncer.dart';
import '../../../core/utility/network_routes.dart';
import '../model/home_response_model.dart';
import '../model/query_model.dart';

class SearchViewModel extends BaseViewModel {
  SearchService? searchService;
  searchServiceInitState() {
    searchService = SearchService(
      Dio(
        BaseOptions(baseUrl: NetworkRoutes.BASE_URL.route),
      ),
    );
    fetchDatas();
    notifyListeners();
  }

  final _debouncer = Debouncer(milliseconds: 500);

  TextEditingController searchController = TextEditingController();

  bool isPageLazyLoad = false;

  bool _isLazyLoadDataFinish = false;

  int _page = 0;

  String _query = 'a';

  bool isEmptyQuery = true;

  bool isEmptyMovieList = false;

  List<Results> movieResultsArray = [];

  HomeResponseModel data = HomeResponseModel();

  void changeIsPageLazyLoad() {
    isPageLazyLoad = !isPageLazyLoad;
    notifyListeners();
  }

  Future<void> fetchAllLazy(int index) async {
    if (isPageLazyLoad ||
        index != movieResultsArray.length - 1 ||
        _isLazyLoadDataFinish) return;
    changeIsPageLazyLoad();
    changeIsLoading();
    final response = await searchService!.fetchMovie(QueryModel(
      apiKey: dotenv.env['API_KEY'],
      query: _query,
      page: _page + 1,
    ).toJson());
    if (response.results!.isNotEmpty) {
      if (movieResultsArray.isEmpty) {
        movieResultsArray = response.results!;
      } else if (response.results?.last != movieResultsArray.last) {
        movieResultsArray.addAll(response.results!);
        movieResultsArray = movieResultsArray;
      }
      _page++;
    } else {
      _isLazyLoadDataFinish = true;
      isEmptyMovieList = true;
    }
    changeIsPageLazyLoad();
    changeIsLoading();
  }

  void setEmptyQuery() {
    _query = '';
    _page = 0;
    searchController.text = '';
    isEmptyQuery = true;
    notifyListeners();
  }

  Future<void> fetchDatas() async {
    changeIsLoading();
    data = await searchService!.fetchMovie(
      QueryModel(apiKey: dotenv.env['API_KEY'], query: 'a', page: 1).toJson(),
    );
    movieResultsArray = data.results ?? [];
    changeIsLoading();
  }

  fetchAllSearchQuery(String text) {
    _debouncer.run(() {
      if (text.isEmpty) {
        _page = 0;
        changeIsEmptyQuery();
        movieResultsArray = [];
        isEmptyMovieList = false;
      } else {
        isEmptyQuery = false;
        _query = text;
        _isLazyLoadDataFinish = false;
        movieResultsArray.clear();
        isEmptyMovieList = false;
        fetchAllLazy(movieResultsArray.length - 1);
      }
    });
    notifyListeners();
  }

  changeIsEmptyQuery() {
    isEmptyQuery = !isEmptyQuery;
    notifyListeners();
  }
}
