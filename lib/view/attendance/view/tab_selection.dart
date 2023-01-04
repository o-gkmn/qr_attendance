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
        bottomNavigationBar: TabBar(
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          tabs: const [
          Tab(icon: Icon(Icons.qr_code_scanner)),
          Tab(icon: Icon(Icons.person))
        ]),
        body: const TabBarView(children: [
          AttendanceScreenView(),
          HistoryScreen(),
        ]),
      ),
    );
  }
}