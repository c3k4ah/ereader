import 'package:flutter/material.dart';

import '../theme/custom_colors.dart';
import 'over_transparency.dart';
import 'svg_widget.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final ShapeAlignment shapeAlignment;
  final bool? addOverShadow;
  final EdgeInsets? padding;
  final bool? addRadius;
  const CustomContainer({
    super.key,
    required this.child,
    required this.shapeAlignment,
    this.addOverShadow,
    this.padding,
    this.addRadius,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular((addRadius ?? true) ? 30 : 0),
        topRight: Radius.circular((addRadius ?? true) ? 30 : 0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * .7,
        color: themeColor.secondaryColor ?? Colors.grey,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: shapeAlignment == ShapeAlignment.right ? -10 : null,
              left: shapeAlignment == ShapeAlignment.left ? -10 : null,
              child: customSVG(
                path: 'assets/shapes/shape.svg',
                size: 180,
                color: themeColor.backGroundColor?.withOpacity(.2),
              ),
            ),
            Container(
              padding: padding,
              child: child,
            ),
            if (addOverShadow ?? true)
              Align(
                alignment: Alignment.bottomCenter,
                child: overTransparency(
                  color: themeColor.secondaryColor ?? Colors.grey,
                  isReverse: false,
                ),
              )
          ],
        ),
      ),
    );
  }
}

enum ShapeAlignment {
  left,
  right,
}
