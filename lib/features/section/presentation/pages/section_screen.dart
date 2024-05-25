import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/custom_colors.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/scafold_background.dart';

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
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          (loremIpsum * 20),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            overTransparency(
                              color: themeColor.secondaryColor ?? Colors.grey,
                              isReverse: true,
                            ),
                            overTransparency(
                              color: themeColor.secondaryColor ?? Colors.grey,
                              isReverse: false,
                            ),
                          ],
                        ),
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

  Widget overTransparency({
    required Color color,
    required bool isReverse,
  }) {
    List<Color> colors = [
      color.withOpacity(0.2),
      color.withOpacity(0.4),
      color.withOpacity(0.6),
      color.withOpacity(0.8),
      color.withOpacity(0.95),
      color,
    ];
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: isReverse
            ? const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )
            : null,
        gradient: LinearGradient(
          colors: isReverse ? colors.reversed.toList() : colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
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
