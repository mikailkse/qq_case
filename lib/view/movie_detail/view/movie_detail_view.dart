// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:qq_case/core/components/text/headline/headline5_text.dart';
import 'package:qq_case/core/constants/app/app_constants.dart';
import 'package:qq_case/core/constants/color/app_colors.dart';

import 'package:qq_case/view/movie_detail/viewmodel/movie_detail_view_model.dart';

import '../../../core/utility/network_routes.dart';

class MovieDetail extends StatefulWidget {
  static const routeName = 'movieDetail';
  final int? id;

  const MovieDetail({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieDetailViewModel>().movieDetailServiceInitState();
      context.read<MovieDetailViewModel>().fetchMovieDetail(widget.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        Consumer<MovieDetailViewModel>(
          builder: (context, value, child) => SliverAppBar(
            expandedHeight: context.height / 2,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Headline5Text(
                text: innerBoxIsScrolled
                    ? 'Movie Detail'
                    : value.movieDetailModel.originalTitle!,
                color: AppColors.white,
              ),
              centerTitle: true,
              background: value.movieDetailModel.posterPath == null
                  ? Image.network(AppContants.QQLOGO, fit: BoxFit.cover)
                  : Image.network(
                      NetworkRoutes.PHOTO_URL.route +
                          value.movieDetailModel.posterPath.toString(),
                      fit: BoxFit.cover),
            ),
          ),
        ),
      ],
      body: Scaffold(
        body: Consumer<MovieDetailViewModel>(
          builder: (context, value, child) => ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Text(
                  value.movieDetailModel.voteAverage.toString(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
