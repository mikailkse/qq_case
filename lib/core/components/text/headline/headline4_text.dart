import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class Headline4Text extends AutoSizeText {
  Headline4Text({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: dark.textTheme.headline4!.copyWith(
            color: color,
            fontWeight: dark.textTheme.headline4!.fontWeight,
            fontFamily: dark.textTheme.headline4!.fontFamily,
            fontSize: dark.textTheme.headline4!.fontSize,
            fontStyle: dark.textTheme.headline4!.fontStyle,
          ),
        );
}
