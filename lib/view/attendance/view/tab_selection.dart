import 'package:flutter/material.dart';

import '../attendance.dart';

class TabSelection extends StatefulWidget {
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).primaryColor,
              indicator: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              tabs: const [
                Tab(
                    icon: Icon(Icons.qr_code_scanner),
                    text: "QR",
                    iconMargin: EdgeInsets.all(0)),
                Tab(
                    icon: Icon(Icons.person),
                    text: "Geçmiş",
                    iconMargin: EdgeInsets.all(0))
              ]),
        ),
        body: const TabBarView(children: [
          AttendanceScreenView(),
          HistoryScreen(),
        ]),
      ),
    );
  }
}
