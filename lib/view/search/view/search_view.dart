import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:qq_case/core/components/loading/loading.dart';
import 'package:qq_case/core/constants/color/app_colors.dart';
import 'package:qq_case/view/search/viewmodel/search_view_model.dart';

import '../../../core/components/grid/custom_grid_view.dart';
import '../../../core/components/info_card/search_info_card.dart';
import '../../../core/components/textformfield/custom_text_form_field.dart';
import '../search_movie_card.dart';

class SearchView extends StatefulWidget {
  static const routeName = 'searchView';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchViewModel>().searchServiceInitState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _SearchTextFormField(),
                SizedBox(height: 20),
                _SearchMovieCardList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchTextFormField extends StatelessWidget {
  const _SearchTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(
      builder: (context, viewModel, child) => CustomTextFormField(
        controller: viewModel.searchController,
        onChanged: (value) => viewModel.fetchAllSearchQuery(value),
        suffixIcon: viewModel.isEmptyQuery == false
            ? IconButton(
                onPressed: () => viewModel.setEmptyQuery(),
                icon: Icon(
                  Icons.cancel,
                  color: AppColors.white,
                ),
              )
            : Icon(
                Icons.search,
                color: AppColors.whiteGrey,
              ),
      ),
    );
  }
}

class _SearchMovieCardList extends StatelessWidget {
  const _SearchMovieCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(
      builder: (context, viewModel, child) => Padding(
        padding: context.paddingLow,
        child: viewModel.isLoading == true
            ? const Loading()
            : viewModel.isPageLazyLoad
                ? const Loading()
                : viewModel.isEmptyQuery == true
                    ? const SearchInfoCard()
                    : CustomGridView(
                        itemCount: viewModel.movieResultsArray.length,
                        itemBuilder: (context, index) => SearchMovieCard(
                          viewModel: viewModel,
                          index: index,
                        ),
                      ),
      ),
    );
  }
}