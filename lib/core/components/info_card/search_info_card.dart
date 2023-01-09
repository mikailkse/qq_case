import 'package:flutter/material.dart';

import '../../constants/color/app_colors.dart';
import '../text/body/body_medium_text.dart';
import '../text/headline/headline2_text.dart';

class SearchInfoCard extends StatelessWidget {
  const SearchInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          size: 60,
          color: AppColors.white,
        ),
        Headline2Text(
          text: 'Coin not found',
          color: AppColors.white,
        ),
        const SizedBox(height: 5),
        BodyMediumText(
          text: 'Try searching the item with a different keyword.',
          textAlign: TextAlign.center,
          color: AppColors.whiteGrey,
        ),
      ],
    );
  }
}
