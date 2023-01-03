import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class BodyMediumText extends AutoSizeText {
  BodyMediumText({
    Key? key,
    required String text,
    required Color color,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) : super(
          key: key,
          text,
          overflow: overflow,
          textScaleFactor: 1,
          textAlign: textAlign,
          maxLines: maxLines,
          style: dark.textTheme.bodyText2!.copyWith(
            color: color,
            fontWeight: dark.textTheme.bodyText2!.fontWeight,
            fontFamily: dark.textTheme.bodyText2!.fontFamily,
            fontSize: dark.textTheme.bodyText2!.fontSize,
            fontStyle: dark.textTheme.bodyText2!.fontStyle,
          ),
        );
}
