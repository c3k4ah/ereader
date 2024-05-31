import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customSVG({
  required String path,
  double? size,
  Color? color,
  double? elevation,
  BlendMode? blendMode,
}) {
  return Stack(
    alignment: AlignmentDirectional.bottomStart,
    children: [
      if (elevation != null)
        SvgPicture.asset(
          path,
          width: size != null ? (size + 5) : size,
          height: size != null ? (size + 5) : size,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(elevation),
            BlendMode.srcIn,
          ),
        ),
      SvgPicture.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(
                color,
                blendMode ?? BlendMode.srcIn,
              )
            : null,
      ),
    ],
  );
}
