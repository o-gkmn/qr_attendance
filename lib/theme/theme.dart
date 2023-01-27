import 'package:flutter/material.dart';

class CustomThemeData {
  bool isDark;

  CustomThemeData({required this.isDark});

  ThemeData get themeData {
    // TextTheme txtTheme =
    //     (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;

    TextTheme textTheme = const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white, fontSize: 14),
      titleSmall: TextStyle(color: Color(0xff30638E), fontSize: 14, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Color(0xff000000), fontSize: 14)
      );

    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        //primary: const Color(0xff30638E),
        primary: Colors.blue.shade900,
        onPrimary: const Color(0xffFFFFEf),
        //secondary: const Color(0xffE84855),
        secondary: Colors.grey.shade400,
        onSecondary: const Color(0xffEFBCD5),
        error: const Color(0xffFF1B1C),
        onError: const Color(0xffFF1B1C),
        //background: const Color(0xffD8E1FF),
        background: const Color(0xffffffff),
        onBackground: const Color(0xffDBBADD),
        surface: const Color(0xff96CDFF),
        onSurface: const Color(0xffFECFEF));

    ThemeData theme = ThemeData.from(colorScheme: colorScheme, textTheme: textTheme);
    return theme;
  }
}
