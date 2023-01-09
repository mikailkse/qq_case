// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:qq_case/core/components/text/body/body_medium_text.dart';
import 'package:qq_case/core/components/text/headline/headline5_text.dart';
import 'package:qq_case/core/constants/app/app_constants.dart';
import 'package:qq_case/core/constants/color/app_colors.dart';
import 'package:qq_case/view/search/viewmodel/search_view_model.dart';

import '../../../core/utility/network_routes.dart';
import '../../movie_detail/view/movie_detail_view.dart';

class SearchMovieCard extends StatelessWidget {
  SearchViewModel viewModel;
  int index;

  SearchMovieCard({
    Key? key,
    required this.viewModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieResult = viewModel.movieResultsArray[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetail(id: movieResult.id),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: movieResult.posterPath == null
                    ? const NetworkImage(
                        AppContants.QQLOGO,
                      )
                    : NetworkImage(NetworkRoutes.PHOTO_URL.route +
                        movieResult.posterPath.toString()),
                fit: BoxFit.cover,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              height: context.mediumValue * 1.8,
              width: context.width * 0.30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Headline5Text(
                  text: movieResult.originalTitle.toString(),
                  color: AppColors.white,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: context.lowBorderRadius,
              ),
              child: Center(
                child: BodyMediumText(
                  text: movieResult.voteAverage.toString(),
                  color: AppColors.dark,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
