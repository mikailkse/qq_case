import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class Headline5Text extends AutoSizeText {
  Headline5Text({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: dark.textTheme.headline5!.copyWith(
            color: color,
            fontWeight: dark.textTheme.headline5!.fontWeight,
            fontFamily: dark.textTheme.headline5!.fontFamily,
            fontSize: dark.textTheme.headline5!.fontSize,
            fontStyle: dark.textTheme.headline5!.fontStyle,
          ),
        );
}
