import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theme/custom_colors.dart';


@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return   Scaffold(
      body: SafeArea(
        child:Row(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width*.25,
              height: MediaQuery.sizeOf(context).height,
              color: Colors.grey,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width*.75,
              height: MediaQuery.sizeOf(context).height,
              padding:const EdgeInsets.symmetric(horizontal: 15),
              color: themeColor.secondaryColor,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    // padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                        'assets/images/suntzu_face.png',
                        colorBlendMode: BlendMode.darken,
                    ),
                  ),
                Divider(
                  thickness: 1,
                  color: themeColor.backGroundColor,
                ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildListTile(
                    title: 'Telechargements',
                    onTap: () {},
                    icon: Iconsax.audio_square,
                    themeColor: themeColor,
                  ),
                  _buildListTile(
                    title: 'Liste des articles',
                    onTap: () {},
                    icon: Iconsax.document_1,
                    themeColor: themeColor,
                  ),
                  _buildListTile(
                    title: 'Parametres',
                    onTap: () {},
                    icon: Iconsax.setting_2,
                    themeColor: themeColor,
                  ),
               const Spacer(),
                  // Text(
                  //   'All rights reserved 2024 - Dominick',
                  //   style: TextStyle(
                  //     fontSize: 10,
                  //     color: themeColor.backGroundColor,
                  //     fontWeight: FontWeight.normal,
                  //     fontFamily: 'Roboto',
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildListTile({
    required String title,
    required Function() onTap,
    required IconData icon,
    required AppColors themeColor,
}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 50,
        decoration: BoxDecoration(
          color: themeColor.backGroundColor?.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: themeColor.backGroundColor,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: themeColor.backGroundColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        )
      ),
    );
  }
}
