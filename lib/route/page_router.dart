import 'package:flutter/material.dart';
import 'package:qr_attendance/view/attendance/view/attendance_screen.dart';
import 'package:qr_attendance/view/login/login.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/attendance":
        return MaterialPageRoute(builder: (_) => const AttendanceScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                  "${settings.name} ile ilgili herhnagi bir sayfa bulunamadı"),
            ),
          ),
        );
    }
  }
}
