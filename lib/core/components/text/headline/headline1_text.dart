import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class Headline1Text extends AutoSizeText {
  Headline1Text({
    Key? key,
    required String text,
    required Color color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) : super(
          key: key,
          text,
          overflow: overflow,
          textScaleFactor: 1,
          textAlign: textAlign,
          maxLines: maxLines,
          style: dark.textTheme.headline1!.copyWith(
            color: color,
            fontWeight: dark.textTheme.headline1!.fontWeight,
            fontFamily: dark.textTheme.headline1!.fontFamily,
            fontSize: dark.textTheme.headline1!.fontSize,
            fontStyle: dark.textTheme.headline1!.fontStyle,
          ),
        );
}
