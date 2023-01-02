import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AttendanceScreenView(),
    );
  }
}

class AttendanceScreenView extends StatelessWidget {
  const AttendanceScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(),
      ],
    );
  }
}

class _Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Özgür Gökmen",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Bilgisayar Mühendisliği",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }

}
