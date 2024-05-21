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
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(top: 60),
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
                      width: 30,
                      height: 30,
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
                width: 30,
                height: 30,
                color: themeColor.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}