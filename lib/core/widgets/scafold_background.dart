import 'package:flutter/material.dart';

import 'svg_widget.dart';

class ScafoldWithShape extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final ShapePosition shapePosition;
  const ScafoldWithShape({
    super.key,
    this.body,
    this.appBar,
    required this.shapePosition,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              color: Color(0xFFf4e9dc),
            ),
            child: Stack(
              children: ScafoldShapeType().getShapes(shapePosition),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: false,
            appBar: appBar,
            body: body,
          ),
        ],
      ),
    );
  }
}

enum ShapePosition {
  shapesBigRight,
  shapesBigLeft,
  shapesLeftAll,
  topRightBottomLeft,
}

class ScafoldShapeType {
  final Color _primaryColor = const Color(0xFFf4e9dc);
  final Color _secondaryColor = const Color(0xFFe85e56);
  final Color _darkColor = const Color(0xFF494949).withOpacity(.6);

  List<Widget> getShapes(ShapePosition position) {
    switch (position) {
      case ShapePosition.shapesBigRight:
        return shapesBigRight;
      case ShapePosition.shapesBigLeft:
        return shapesBigLeft;
      case ShapePosition.shapesLeftAll:
        return shapesLeftAll;
      case ShapePosition.topRightBottomLeft:
        return topRightBottomLeft;
      default:
        return [];
    }
  }

  List<Widget> get shapesBigRight => [
        Positioned(
          top: 100,
          right: 40,
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _secondaryColor,
                width: 3,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: -150,
          child: customSVG(
            path: 'assets/shapes/circle.svg',
            height: 400,
            width: 400,
          ),
        ),
        Positioned(
          bottom: 250,
          right: 70,
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _primaryColor,
                width: 3,
              ),
            ),
          ),
        ),
      ];
  List<Widget> get shapesBigLeft => [
        Positioned(
          top: 100,
          left: 40,
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _secondaryColor,
                width: 3,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: -150,
          child: customSVG(
            path: 'assets/shapes/circle.svg',
            height: 400,
            width: 400,
          ),
        ),
        Positioned(
          bottom: 250,
          left: 70,
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _primaryColor,
                width: 3,
              ),
            ),
          ),
        ),
      ];
  List<Widget> get shapesLeftAll => [
        Positioned(
          top: 80,
          right: -50,
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _secondaryColor,
                width: 3,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: -150,
          child: customSVG(
            path: 'assets/shapes/circle.svg',
            height: 350,
            width: 350,
          ),
        ),
        Positioned(
          top: 100,
          right: 10,
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _primaryColor,
                width: 3,
              ),
            ),
          ),
        ),
      ];
  List<Widget> get topRightBottomLeft => [
        //Top Right
        Positioned(
          top: -50,
          right: -150,
          child: customSVG(
            path: 'assets/shapes/circle.svg',
            height: 400,
            width: 400,
          ),
        ),
        Positioned(
          top: 180,
          left: 20,
          child: customSVG(
            path: 'assets/shapes/shape.svg',
            height: 100,
            width: 100,
            color: _darkColor,
          ),
        ),
        Positioned(
          top: 320,
          right: 100,
          child: customSVG(
            path: 'assets/shapes/shape.svg',
            height: 200,
            width: 200,
            color: _darkColor,
          ),
        ),
        Positioned(
          top: 80,
          right: 0,
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _secondaryColor,
                width: 3,
              ),
            ),
          ),
        ),

        Positioned(
          top: 130,
          right: -70,
          child: Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _primaryColor,
                width: 3,
              ),
            ),
          ),
        ),
        //Bottom Left
        Positioned(
          bottom: -150,
          left: -150,
          child: customSVG(
            path: 'assets/shapes/circle.svg',
            height: 350,
            width: 350,
          ),
        ),
        Positioned(
          bottom: -130,
          left: 70,
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _secondaryColor,
                width: 3,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 150,
          left: -50,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _primaryColor,
                width: 3,
              ),
            ),
          ),
        ),
      ];
}
