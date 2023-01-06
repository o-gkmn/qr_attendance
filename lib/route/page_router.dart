import 'package:flutter/material.dart';
import 'package:qr_attendance/view/account/view/account_screen.dart';
import 'package:qr_attendance/view/attendance/view/tab_selection.dart';
import 'package:qr_attendance/view/faq/faq.dart';
import 'package:qr_attendance/view/login/login.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/attendance":
        return MaterialPageRoute(builder: (_) => const TabSelection());
      case "/faq":
        return MaterialPageRoute(builder: (_) => const FAQScreen());
      case "/account":
        return MaterialPageRoute(builder: (_) => const AccountScreen());
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
