import 'package:auto_route/auto_route.dart';
import 'package:ereader/core/extension/date_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/custom_colors.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../domain/entities/section_entity.dart';

class SectionItemWidget extends StatelessWidget {
  final SectionEntity section;
  final AppColors themeColor;
  const SectionItemWidget(
      {super.key, required this.section, required this.themeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: themeColor.backGroundColor ?? Colors.grey,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: TextStyle(
              fontSize: 35,
              color: themeColor.backGroundColor ?? Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            section.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              color: themeColor.backGroundColor ?? Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                section.date.formatToHuman,
                style: TextStyle(
                  fontSize: 18,
                  color: themeColor.backGroundColor ?? Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              InkWell(
                onTap: () {
                  context.router.pushNamed('/chapter');
                },
                child: Transform.rotate(
                  angle: 3.14 / 2,
                  child: customSVG(
                    elevation: .2,
                    path: 'assets/icons/arrow.svg',
                    size: 100,
                    color: themeColor.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Commencer la lecture',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                color: themeColor.backGroundColor ?? Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}