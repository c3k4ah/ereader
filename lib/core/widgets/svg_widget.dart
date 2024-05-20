import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customSVG({
  required String path,
  double? width,
  double? height,
  Color? color,
}) {
  return SvgPicture.asset(
    path,
    width: width,
    height: height,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}
