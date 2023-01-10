import 'package:flutter/material.dart';

class PointCard extends StatelessWidget {
  final double? text;

  const PointCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 10,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            (text ?? 0).roundToDouble().toString(),
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
