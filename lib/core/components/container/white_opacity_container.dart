import 'package:flutter/material.dart';

class WhiteOpacityContainer extends Container {
  WhiteOpacityContainer(
      {super.key, double? width, Widget? child, double? height})
      : super(
          width: width,
          height: height,
          child: child,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
        );
}
