// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:qq_case/core/constants/app/app_constants.dart';
import 'package:qq_case/core/constants/color/app_colors.dart';
import 'package:qq_case/view/movie_detail/viewmodel/movie_detail_view_model.dart';

import '../../../core/components/card/point_card.dart';
import '../../../core/components/container/white_opacity_container.dart';
import '../../../core/components/divider/dark_vertical_divider.dart';
import '../../../core/components/text/body/body_medium_text.dart';
import '../../../core/components/text/body/body_small_text.dart';
import '../../../core/components/text/headline/headline3_text.dart';
import '../../../core/components/text/headline/headline4_text.dart';
import '../../../core/components/text/headline/headline5_text.dart';
import '../../../core/utility/network_routes.dart';

part '../_widget/movie_detail_appbar.dart';

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
    return Consumer<MovieDetailViewModel>(
      builder: (context, viewModel, child) => Scaffold(
        appBar: _MovieDetailAppBar(
          text: viewModel.movieDetailModel.title.toString(),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                _DetailPart1(viewModel: viewModel),
                _DetailPart2(viewModel: viewModel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailPart1 extends StatelessWidget {
  MovieDetailViewModel viewModel;
  _DetailPart1({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: context.height * 0.8,
                  width: context.width * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: viewModel.movieDetailModel.posterPath == null
                          ? const NetworkImage(
                              AppContants.QQLOGO,
                            )
                          : NetworkImage(
                              NetworkRoutes.PHOTO_URL.route +
                                  viewModel.movieDetailModel.posterPath
                                      .toString(),
                            ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: context.lowBorderRadius,
                  ),
                ),
                PointCard(text: viewModel.movieDetailModel.voteAverage),
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: context.mediumValue * 0.2),
                    child: Headline4Text(
                      text: 'Overview',
                      color: AppColors.white,
                    ),
                  ),
                  BodyMediumText(
                    text: viewModel.movieDetailModel.overview.toString(),
                    textAlign: TextAlign.start,
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailPart2 extends StatelessWidget {
  MovieDetailViewModel viewModel;
  _DetailPart2({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.15), BlendMode.dstATop),
            image: viewModel.movieDetailModel.backdropPath == null
                ? const NetworkImage(
                    AppContants.QQLOGO,
                  )
                : NetworkImage(
                    NetworkRoutes.PHOTO_URL.route +
                        viewModel.movieDetailModel.backdropPath.toString(),
                  ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Headline3Text(
                    text: 'Popularity',
                    color: AppColors.white,
                  ),
                  BodySmallText(
                    text: viewModel.movieDetailModel.popularity.toString(),
                    color: AppColors.white,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  viewModel.movieDetailModel.productionCompanies?.isEmpty ??
                          false
                      ? const SizedBox()
                      : Padding(
                          padding: context.verticalPaddingNormal * .6,
                          child: Headline3Text(
                              text: 'Production Companies',
                              color: AppColors.white),
                        ),
                  viewModel.movieDetailModel.productionCompanies?.isEmpty ??
                          false
                      ? const SizedBox()
                      : WhiteOpacityContainer(
                          height: context.width * 0.2,
                          width: context.width * 0.9,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: viewModel.movieDetailModel
                                    .productionCompanies?.length ??
                                0,
                            itemBuilder: (context, index) => viewModel
                                    .movieDetailModel
                                    .productionCompanies!
                                    .isEmpty
                                ? const SizedBox()
                                : Padding(
                                    padding: context.paddingLow,
                                    child: Container(
                                      child: viewModel
                                                  .movieDetailModel
                                                  .productionCompanies![index]
                                                  .logoPath ==
                                              null
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(Icons
                                                    .image_not_supported_rounded),
                                                Center(
                                                  child: Text(viewModel
                                                      .movieDetailModel
                                                      .productionCompanies![
                                                          index]
                                                      .name
                                                      .toString()),
                                                ),
                                              ],
                                            )
                                          : SizedBox(
                                              height: context.height * 0.2,
                                              width: context.width * .3,
                                              child: viewModel
                                                          .movieDetailModel
                                                          .productionCompanies![
                                                              index]
                                                          .logoPath ==
                                                      null
                                                  ? const SizedBox()
                                                  : Image.network(
                                                      NetworkRoutes
                                                              .PHOTO_URL.route +
                                                          viewModel
                                                              .movieDetailModel
                                                              .productionCompanies![
                                                                  index]
                                                              .logoPath
                                                              .toString(),
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                    ),
                                  ),
                            separatorBuilder: (context, index) =>
                                DarkVerticalDivider(),
                          ),
                        ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Headline3Text(
                      text: 'Spoken Languages', color: AppColors.white),
                  SizedBox(
                    height: context.width * 0.08,
                    width: context.width * 0.9,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: viewModel
                                .movieDetailModel.spokenLanguages?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: context.paddingLow * 0.2,
                            child: WhiteOpacityContainer(
                              width: context.width * 0.3,
                              child: Center(
                                child: BodyMediumText(
                                  text: viewModel.movieDetailModel
                                      .spokenLanguages![index].englishName
                                      .toString(),
                                  color: AppColors.dark,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Headline3Text(
                    text: 'Status',
                    color: AppColors.white,
                  ),
                  BodySmallText(
                    text: viewModel.movieDetailModel.status.toString(),
                    color: AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
