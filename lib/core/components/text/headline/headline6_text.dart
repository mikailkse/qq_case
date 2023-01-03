import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class Headline6Text extends AutoSizeText {
  Headline6Text({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: dark.textTheme.headline6!.copyWith(
            color: color,
            fontWeight: dark.textTheme.headline6!.fontWeight,
            fontFamily: dark.textTheme.headline6!.fontFamily,
            fontSize: dark.textTheme.headline6!.fontSize,
            fontStyle: dark.textTheme.headline6!.fontStyle,
          ),
        );
}
