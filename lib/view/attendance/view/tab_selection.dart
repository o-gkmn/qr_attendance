import 'package:flutter/material.dart';

import '../attendance.dart';

class TabSelection extends StatefulWidget{
  const TabSelection({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabSelectionState();
  }
}

class _TabSelectionState extends State<TabSelection> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(tabs: [
          Tab(child: Icon(Icons.qr_code_scanner, color: Theme.of(context).primaryColor,)),
          Tab(child: Icon(Icons.person, color: Theme.of(context).primaryColor))
        ]),
        body: const TabBarView(children: [
          AttendanceScreenView(),
          HistoryScreen(),
        ]),
      ),
    );
  }
}