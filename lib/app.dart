import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();
    final router = AppRouter();
    return MaterialApp.router(
      title: 'E-Reader',
      theme: appTheme.light,
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
