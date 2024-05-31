import 'package:flutter/material.dart';

import '../theme/custom_colors.dart';
import 'svg_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onMenuTap,
    this.onBackTap,
  });

  final VoidCallback? onMenuTap;
  final VoidCallback? onBackTap;
  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: themeColor.secondaryColor ?? Colors.grey,
              width: 3,
            ),
            top: BorderSide(
              color: themeColor.secondaryColor ?? Colors.grey,
              width: 3,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'E.reader',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: onBackTap ?? () {},
                  child: Transform.rotate(
                    //turn to left
                    angle: -3.14 / 2,
                    child: customSVG(
                      path: 'assets/icons/arrow.svg',
                      size: 30,
                      color: themeColor.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: onMenuTap ?? () {},
              child: customSVG(
                path: 'assets/icons/menu.svg',
                size: 30,
                color: themeColor.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
