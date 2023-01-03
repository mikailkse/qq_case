import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class Headline3Text extends AutoSizeText {
  Headline3Text({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: dark.textTheme.headline3!.copyWith(
            color: color,
            fontWeight: dark.textTheme.headline3!.fontWeight,
            fontFamily: dark.textTheme.headline3!.fontFamily,
            fontSize: dark.textTheme.headline3!.fontSize,
            fontStyle: dark.textTheme.headline3!.fontStyle,
          ),
        );
}
