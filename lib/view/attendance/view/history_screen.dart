import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../attendance.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AttendanceCubit, AttendanceState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<AttendanceCubit, AttendanceState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return Column(
                  children: [
                    _Header(),
                    const Spacer(flex: 1),
                    const CircularProgressIndicator(),
                    const Spacer(flex: 1)
                  ],
                );
              case Status.inital:
              case Status.succes:
              case Status.failure:
                return _HistoryScreenView();
            }
          },
        );
      },
    ));
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
    return BlocBuilder<AttendanceCubit, AttendanceState>(
        builder: (context, state) {
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
                    onPressed: () =>
                        context.read<AttendanceCubit>().updateSort(),
                    icon: const Icon(
                      Icons.list,
                      color: Colors.white,
                    )),
                const Spacer(flex: 1),
                IconButton(
                    onPressed: () =>
                        context.read<AttendanceCubit>().deleteLessons(),
                    icon: const Icon(Icons.delete, color: Colors.white)),
              ],
            ),
            const Spacer(flex: 1),
            Center(
              child:
                  Text("Geçmiş", style: Theme.of(context).textTheme.titleLarge),
            ),
            const Spacer(flex: 3)
          ],
        ),
      );
    });
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: state.studentLessonsInformation.pastLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.studentLessonsInformation.pastLessons[index],
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text(state.studentLessonsInformation.date[index],
                    style: Theme.of(context).textTheme.bodySmall),
              );
            },
          ),
        );
      },
    );
  }
}
