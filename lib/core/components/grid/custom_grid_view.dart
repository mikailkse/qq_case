import 'package:flutter/material.dart';

class CustomGridView extends GridView {
  CustomGridView({
    super.key,
    required Widget Function(BuildContext, int) itemBuilder,
    int? itemCount,
  }) : super.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
}
