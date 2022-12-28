import 'package:flutter/material.dart';
import 'package:qr_attendance/view/home/home.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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
