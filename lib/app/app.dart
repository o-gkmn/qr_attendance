import 'package:flutter/material.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/route/page_router.dart';
import 'package:qr_attendance/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key, required this.studentRepository});
  final StudentRepository studentRepository;
  @override
  Widget build(BuildContext context) {
    CustomThemeData customTheme = CustomThemeData(isDark: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme.themeData,
      onGenerateRoute: PageRouter.generateRoute,
      initialRoute: "/login",
    );
  }
}
