import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../routes/app_router.dart';
import '../theme/custom_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return Drawer(
      backgroundColor: themeColor.secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        minimum:  const EdgeInsets.symmetric(horizontal: 15),
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
              onTap: () {
                // context.router.pushNamed('/section');
                Navigator.pop(context);
                context.router.popAndPush(const SectionRoute());
              },
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
