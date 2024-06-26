import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../core/DTO/entities/article_entity.dart';
import '../../../../core/theme/custom_colors.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/scafold_background.dart';
import '../../../../core/extension/int_extension.dart';
import '../../../../core/widgets/snack_bar.dart';

@RoutePage()
class ChapterPage extends StatefulWidget {
  final ArticleEntity article;
  const ChapterPage({
    super.key,
    required this.article,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  bool isFullScreen = false;
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return ScaffoldWithShape(
      shapePosition: ShapePosition.shapesBigRight,
      addAppBar: !isFullScreen,
      onBackTap: () {
        Navigator.pop(context);
      },
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(
          horizontal: isFullScreen ? 0 : 10,
        ),
        child: Column(
          children: [
            if (!isFullScreen) chapterHeaderWidget(),
            Expanded(
              child: CustomContainer(
                addRadius: !isFullScreen,
                addOverShadow: false,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shapeAlignment: ShapeAlignment.left,
                child: Column(
                  children: [
                    contentSettings(
                      color: themeColor.backGroundColor ?? Colors.white,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.article.content ?? '',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                              color: themeColor.backGroundColor ?? Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 35,
                      child: Text(
                        '1/45',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: themeColor.primaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contentSettings({
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                isFullScreen = !isFullScreen;
              });
            },
            icon: Icon(
              isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
              size: 35,
              color: color,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showSnackBar(context,'Cet article ne possède pas encore de format audio !');
            },
            icon: Icon(
              Icons.mic_off,
              size: 25,
              color: color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.contrast,
              size: 25,
              color: color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.text_fields,
              size: 25,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget chapterHeaderWidget() {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Article ${widget.article.article?.toRoman()}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                widget.article.title ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
