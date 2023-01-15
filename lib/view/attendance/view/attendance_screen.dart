import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/view/attendance/view/qr_camera_screen.dart';

import '../cubit/attendance_cubit.dart';

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
      GeneralUserInf generalUserInf = const GeneralUserInf.empty();
      if(state is AttendanceLoaded){
        generalUserInf = state.generalUserInf;
      }
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
                      onPressed: () => Navigator.pushNamed(context, "/account"),
                      icon: const Icon(Icons.person, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "${generalUserInf.name} ${generalUserInf.surname}",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                generalUserInf.department,
                style: Theme.of(context).textTheme.subtitle1,
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
              style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }
}
