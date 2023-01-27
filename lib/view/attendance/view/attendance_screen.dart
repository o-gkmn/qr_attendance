import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../attendance.dart';


class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

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
                  return const AttendanceScreenView();
              }
            },
          );
        },
      ),
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
        const Spacer(flex: 1),
        _Body(),
        const Spacer(flex: 1),
      ],
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pushNamed(context, "/faq"),
                      icon: const Icon(Icons.help, color: Colors.white)),
                  IconButton(
                      onPressed: () => Navigator.pushNamed(context, "/account", arguments: context.read<AttendanceCubit>().studentNo),
                      icon: const Icon(Icons.person, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "${state.studentInformation.name} ${state.studentInformation.surname}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                state.studentInformation.department,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (context) {
        return const QRCameraScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _showSheet(context);
      },
      child: Column(
        children: [
          Icon(
            Icons.qr_code_scanner,
            size: MediaQuery.of(context).size.height * 0.20,
            color: Theme.of(context).primaryColor,
          ),
          Text("Okutmak için tıklayın",
              style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
