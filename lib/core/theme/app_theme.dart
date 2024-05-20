import 'package:flutter/material.dart';

import 'custom_colors.dart';

class AppTheme {
  // AppColors themeColors(context) =>Theme.of(context).extension<AppColors>()!;

  ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Gibson',
    scaffoldBackgroundColor: const Color(0xFFf4e9dc),
    extensions: const <ThemeExtension<AppColors>>[
      AppColors(
        primaryColor: Color(0xFFe85e56),
        secondaryColor: Color(0xFF494949),
        backGroundColor: Color(0xFFf4e9dc),
      )
    ],
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFf4e9dc),
    ),
  );
}
