import 'package:flutter/material.dart';

class CustomThemeData {
  bool isDark;

  CustomThemeData({required this.isDark});

  ThemeData get themeData {
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;

    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: const Color(0xff30638E),
        onPrimary: const Color(0xffFFFFEF),
        secondary: const Color(0xffE84855),
        onSecondary: const Color(0xffEFBCD5),
        error: const Color(0xffFF1B1C),
        onError: const Color(0xffFF1B1C),
        background: const Color(0xffD8E1FF),
        onBackground: const Color(0xffDBBADD),
        surface: const Color(0xff96CDFF),
        onSurface: const Color(0xffFECFEF));

    var t = ThemeData.from(colorScheme: colorScheme, textTheme: txtTheme);
    return t;
  }
}
