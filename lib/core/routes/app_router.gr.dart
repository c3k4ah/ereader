// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChapterRoute.name: (routeData) {
      final args = routeData.argsAs<ChapterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChapterPage(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    SectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SectionPage(),
      );
    },
  };
}

/// generated route for
/// [ChapterPage]
class ChapterRoute extends PageRouteInfo<ChapterRouteArgs> {
  ChapterRoute({
    Key? key,
    required ArticleEntity article,
    List<PageRouteInfo>? children,
  }) : super(
          ChapterRoute.name,
          args: ChapterRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ChapterRoute';

  static const PageInfo<ChapterRouteArgs> page =
      PageInfo<ChapterRouteArgs>(name);
}

class ChapterRouteArgs {
  const ChapterRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final ArticleEntity article;

  @override
  String toString() {
    return 'ChapterRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SectionPage]
class SectionRoute extends PageRouteInfo<void> {
  const SectionRoute({List<PageRouteInfo>? children})
      : super(
          SectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
