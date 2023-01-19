import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/route/page_router.dart';
import 'package:qr_attendance/view/account/cubit/account_cubit.dart';
import 'package:qr_attendance/view/attendance/cubit/cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.studentNo});

  final String studentNo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(
          studentNo: studentNo,
          studentRepository: RepositoryProvider.of<StudentRepository>(context)),
      child: _AccountScreenView(),
    );
  }
}

class _AccountScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap"),
      ),
      body: BlocConsumer<AccountCubit, AccountState>(
        bloc: BlocProvider.of<AccountCubit>(context)..fetchStudentInformation(),
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<AccountCubit, AccountState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.loading:
                  return const Center(child: CircularProgressIndicator());
                case Status.inital:
                case Status.succes:
                case Status.failure:
                  return _AccountScreenBody();
              }
            },
          );
        },
      ),
    );
  }
}

class _AccountScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                child: Row(children: [
                  const Text("Ad:"),
                  const Spacer(),
                  Text(state.studentInformation.name)
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                child: Row(children: [
                  const Text("Soyad:"),
                  const Spacer(),
                  Text(state.studentInformation.surname)
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                child: Row(children: [
                  const Text("Fakülte:"),
                  const Spacer(),
                  Text(state.studentInformation.faculty)
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: Row(children: [
                  const Text("Bölüm:"),
                  const Spacer(),
                  Text(state.studentInformation.department)
                ]),
              ),
              TextButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, "/login", (Route<dynamic> route) => false),
                  child: const Text("Çıkış Yap")),
            ],
          ),
        );
      },
    );
  }
}
