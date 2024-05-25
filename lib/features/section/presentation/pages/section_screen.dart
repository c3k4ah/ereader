import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/custom_colors.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/scafold_background.dart';
import '../../../../core/widgets/over_transparency.dart';
import '../../domain/entities/section_entity.dart';
import '../widgets/section_item_widget.dart';

String loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.';

@RoutePage()
class SectionPage extends StatelessWidget {
  const SectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return ScafoldWithShape(
      shapePosition: ShapePosition.shapesLeftAll,
      appBar: CustomAppBar(
        onMenuTap: () {},
      ),
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
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * .7,
                decoration: BoxDecoration(
                  color: themeColor.secondaryColor ?? Colors.grey,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15).copyWith(bottom: 0),
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.builder(
                        itemCount: sectionList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          SectionEntity section = sectionList[index];
                          return SectionItemWidget(
                            section: section,
                            themeColor: themeColor,
                          );
                        },
                      ),
                    ),
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
                'Select the Story',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'Of your choice',
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

List<SectionEntity> sectionList = [
  SectionEntity(
    id: '1',
    title: 'Section 1',
    description: (loremIpsum * 10),
    date: DateTime.now(),
  ),
  SectionEntity(
    id: '2',
    title: 'Section 2',
    description: (loremIpsum * 10),
    date: DateTime.now(),
  ),
  SectionEntity(
    id: '3',
    title: 'Section 3',
    description: (loremIpsum * 10),
    date: DateTime.now(),
  ),
  SectionEntity(
    id: '4',
    title: 'Section 4',
    description: (loremIpsum * 10),
    date: DateTime.now(),
  ),
  SectionEntity(
    id: '5',
    title: 'Section 5',
    description: (loremIpsum * 10),
    date: DateTime.now(),
  ),
  SectionEntity(
    id: '6',
    title: 'Section 6',
    description: (loremIpsum * 10),
    date: DateTime.now(),
  ),
];
