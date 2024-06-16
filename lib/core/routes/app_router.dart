import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/article/presentation/pages/article_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/section/presentation/pages/section_screen.dart';
import '../DTO/entities/article_entity.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ChapterRoute.page,
          path: '/chapter',
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: '/profile',
        ),
        AutoRoute(
          page: SectionRoute.page,
          path: '/section',
          initial: true,
        ),
      ];
}
