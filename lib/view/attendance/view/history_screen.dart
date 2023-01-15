import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_attendance/api/models/students_lessons_inf/students_lessons_inf.dart';

import '../cubit/attendance_cubit.dart';

List<String> lessonsCode = [
  "BLG 308",
  "BLG 308",
  "BLG 308",
  "BLG 308",
  "BLG 308",
  "BLG 308",
  "BLG 308",
  "BLG 308",
  "BLG 308",
  "BLG 308",
  "BLG 308",
];
List<String> date = [
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27",
  "25.10.2022 10.27"
];

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HistoryScreenView(),
    );
  }
}

class _HistoryScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_Header(), _Body()],
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.list,
                    color: Colors.white,
                  )),
              const Spacer(flex: 1),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: Colors.white)),
            ],
          ),
          const Spacer(flex: 1),
          Center(
            child: Text("Geçmiş", style: Theme.of(context).textTheme.headline6),
          ),
          const Spacer(flex: 3)
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        StudentsLessonsInf studentsLessonsInf = StudentsLessonsInf.empty();
        if (state is AttendanceLoaded) {
          studentsLessonsInf = state.studentsLessonsInf;
        }
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: studentsLessonsInf.pastLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(studentsLessonsInf.pastLessons[index],
                    style: Theme.of(context).textTheme.bodyText2),
                subtitle: Text(studentsLessonsInf.date[index],
                    style: Theme.of(context).textTheme.caption),
              );
            },
          ),
        );
      },
    );
  }
}
