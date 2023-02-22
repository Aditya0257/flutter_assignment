import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class Indicator extends StatelessWidget {
  final double scale;
  final Color color;
  const Indicator({super.key, required this.scale, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(scale: scale, duration: const Duration(milliseconds:500),child: Container(
                          width: Dimensions.width20,
                          height: Dimensions.width20,
                          decoration: BoxDecoration(
                              color:color, shape: BoxShape.circle),
                        ),);
  }
}