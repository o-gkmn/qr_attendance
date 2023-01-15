import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/view/attendance/cubit/attendance_cubit.dart';

import '../attendance.dart';

class TabSelection extends StatelessWidget {
  final String studentNo;

  const TabSelection({super.key, required this.studentNo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceCubit(
          studentRepository: RepositoryProvider.of<StudentRepository>(context),
          studentNo: studentNo),
      child: const TabSelectionView(),
    );
  }
}

class TabSelectionView extends StatelessWidget {
  const TabSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<AttendanceCubit>(context)..emitStudentInfo(),
      builder: (context, state) {
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
            body: const TabBarView(
              children: [
                AttendanceScreenView(),
                HistoryScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
