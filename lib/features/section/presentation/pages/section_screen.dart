import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DTO/entities/article_entity.dart';
import '../../../../core/theme/custom_colors.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/scafold_background.dart';
import '../manager/article_bloc.dart';
import '../widgets/section_item_widget.dart';

@RoutePage()
class SectionPage extends StatefulWidget {
  const SectionPage({super.key});

  @override
  State<SectionPage> createState() => _SectionPageState();
}

class _SectionPageState extends State<SectionPage> {
  @override
  void initState() {
    context.read<ArticleBloc>().add(const GetAllArticleEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return ScaffoldWithShape(
      shapePosition: ShapePosition.shapesLeftAll,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            headerWidget(),
            Expanded(
              child: CustomContainer(
                shapeAlignment: ShapeAlignment.right,
                child: BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case ArticleStatus.loading:
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: themeColor.backGroundColor,
                          ),
                        );
                      case ArticleStatus.loaded:
                        return Container(
                          padding: const EdgeInsets.all(15).copyWith(bottom: 0),
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                            itemCount: state.articles.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              ArticleEntity section = state.articles[index];
                              return SectionItemWidget(
                                article: section,
                                themeColor: themeColor,
                              );
                            },
                          ),
                        );
                      case ArticleStatus.error:
                        return Center(
                          child: Text(state.error ?? ""),
                        );
                      default:
                        return Text(state.error ?? "");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 20),
      child: const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choisissez l'article",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                'De votre choix',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
