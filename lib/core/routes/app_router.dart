import 'package:auto_route/auto_route.dart';

import '../../features/chapter/presentation/pages/chapter_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/section/presentation/pages/section_screen.dart';

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