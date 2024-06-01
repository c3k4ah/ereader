import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import '../../../../core/DTO/entties/article_entity.dart';
import '../../../../core/theme/custom_colors.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../../core/extension/int_extension.dart';

class SectionItemWidget extends StatelessWidget {
  final ArticleEntity article;
  final AppColors themeColor;
  const SectionItemWidget({
    super.key,
    required this.article,
    required this.themeColor,
  });

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
            "Article ${article.article?.toRoman()}",
            style: TextStyle(
              fontSize: 35,
              color: themeColor.backGroundColor ?? Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            "Sun Tzu dit : ${article.content}",
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
              Expanded(
                child: Text(
                  "${article.title} (${article.originalTitle})",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: themeColor.backGroundColor ?? Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
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
