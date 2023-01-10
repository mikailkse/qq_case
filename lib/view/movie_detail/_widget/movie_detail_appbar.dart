part of '../view/movie_detail_view.dart';

class _MovieDetailAppBar extends AppBar {
  _MovieDetailAppBar({required String text})
      : super(
          title: Headline5Text(
            text: text,
            color: AppColors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            )
          ],
        );
}
