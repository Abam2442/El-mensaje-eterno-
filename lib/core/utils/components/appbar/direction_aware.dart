import 'package:flutter/material.dart';
import 'dart:math' as math;

//DirectionAware for rotate the icon to other side rtl or ltr
// من شان تدوير الايقونة بزاوية 90
class DirectionAware extends StatelessWidget {
  final Widget child;

  const DirectionAware({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final currentDirection = Directionality.of(context);

    return Transform.rotate(
      angle: currentDirection == TextDirection.rtl ? -math.pi : 0,
      child: child,
    );
  }
}
