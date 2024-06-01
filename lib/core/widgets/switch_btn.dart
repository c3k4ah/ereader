import 'dart:math';

import 'package:flutter/material.dart';

class SwitchModeButton extends StatefulWidget {
  final double buttonSize;
  final bool? isVertical;
  final bool value;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeBtnColor;
  final Color inactiveBtnColor;
  final Function(bool value) onTap;
  final Function()? onEnd;

  const SwitchModeButton({
    super.key,
    required this.buttonSize,
    this.isVertical,
    required this.value,
    required this.activeColor,
    required this.inactiveColor,
    required this.activeBtnColor,
    required this.inactiveBtnColor,
    this.onEnd,
    required this.onTap,
  });

  @override
  State<SwitchModeButton> createState() => _SwitchModeButtonState();
}

class _SwitchModeButtonState extends State<SwitchModeButton> {
  bool isActive = false;
  Size size = const Size(50, 100);
  double initialPosition = 0.0;
  @override
  void initState() {
    isActive = widget.value;
    size = Size(widget.buttonSize, widget.buttonSize * 2);
    initialPosition = isActive ? (size.width - (size.height * 0.02)) : 0.0;
    super.initState();
  }

  void onValueCange() {
    setState(() {
      setState(() {
        initialPosition = !isActive ? (size.width - (size.height * 0.02)) : 0.0;
        isActive = !isActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (widget.isVertical ?? true) ? 0 : pi / 2,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: _buildSwitch(
          size,
        ),
      ),
    );
  }

  Widget _buildSwitch(Size size) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        onValueCange();
        widget.onTap(isActive);
      },
      child: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(size.height * 0.02),
        decoration: BoxDecoration(
          color: isActive ? widget.activeColor : widget.inactiveColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              bottom: initialPosition,
              left: 0,
              right: 0,
              onEnd: widget.onEnd,
              child: Container(
                height: size.width - (size.height * 0.02),
                width: size.width,
                padding: EdgeInsets.all(size.height * 0.02),
                decoration: BoxDecoration(
                  color: isActive
                      ? widget.activeBtnColor
                      : widget.inactiveBtnColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.light,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
