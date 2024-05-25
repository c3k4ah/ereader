import 'package:flutter/widgets.dart';

Widget overTransparency({
  required Color color,
  required bool isReverse,
}) {
  List<Color> colors = [
    color.withOpacity(0.2),
    color.withOpacity(0.4),
    color.withOpacity(0.6),
    color.withOpacity(0.8),
    color.withOpacity(0.95),
    color,
  ];
  return Container(
    height: 55,
    decoration: BoxDecoration(
      borderRadius: isReverse
          ? const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
          : null,
      gradient: LinearGradient(
        colors: isReverse ? colors.reversed.toList() : colors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  );
}
