import 'package:flutter/material.dart';

import '../../constants/color/app_colors.dart';

class DarkVerticalDivider extends VerticalDivider {
  DarkVerticalDivider({super.key})
      : super(
          color: AppColors.dark,
          indent: 10,
          thickness: 0.5,
          endIndent: 10,
        );
}
