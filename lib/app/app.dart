import 'package:flutter/material.dart';
import 'package:qr_attendance/route/page_router.dart';
import 'package:qr_attendance/view/home/home.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: PageRouter.generateRoute,
      initialRoute: "/",
      home: HomeScreen(),
    );
  }

}