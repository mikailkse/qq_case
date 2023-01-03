import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class ButtonLargeText extends AutoSizeText {
  ButtonLargeText({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: dark.textTheme.button!.copyWith(
            color: color,
            fontWeight: dark.textTheme.button!.fontWeight,
            fontFamily: dark.textTheme.button!.fontFamily,
            fontSize: dark.textTheme.button!.fontSize,
            fontStyle: dark.textTheme.button!.fontStyle,
          ),
        );
}
