import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customSVG({
  required String path,
  double? width,
  double? height,
  Color? color,
  BlendMode? blendMode,
}) {
  return SvgPicture.asset(
    path,
    width: width,
    height: height,
    fit: BoxFit.contain,
    colorFilter: color != null
        ? ColorFilter.mode(
            color,
            blendMode ?? BlendMode.srcIn,
          )
        : null,
  );
}
