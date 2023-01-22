import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/api/repository/student_repository.dart';
import 'package:qr_attendance/view/account/cubit/cubit.dart';
import 'package:qr_attendance/view/attendance/attendance.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  late MockStudentRepository mockStudentRepository;
  late AccountCubit accountCubit;

  setUp(() {
    mockStudentRepository = MockStudentRepository();
    accountCubit = AccountCubit(
        studentNo: "200404006", studentRepository: mockStudentRepository);
  });

  group("fetchStudentInformation", () {
    const GeneralUserInf generalUserInf = GeneralUserInf(
        name: "Özgür",
        surname: "surname",
        stdNo: "200404006",
        faculty: "faculty",
        department: "department",
        stdClass: "stdClass");

    final Exception tException = Exception('Failed to fetch goals.');

    blocTest<AccountCubit, AccountState>(
        "emits [Status.loading, Staus.succes] when fetchStudentInformation is called succesfully",
        setUp: () => when((() =>
                mockStudentRepository.getUserInf(accountCubit.studentNo)))
            .thenAnswer((_) async => generalUserInf),
        act: (cubit) => cubit.fetchStudentInformation(),
        build: () => accountCubit,
        expect: () => const <AccountState>[
              AccountState(status: Status.loading),
              AccountState(
                  status: Status.succes, studentInformation: generalUserInf)
            ],
        verify: (_) async {
          verify(() => mockStudentRepository.getUserInf(_.studentNo)).called(1);
        });

    blocTest(
        "emit [Status.loading, Status.succed] when fetchStudentInformation() failed",
        setUp: () => when((() =>
                mockStudentRepository.getUserInf(accountCubit.studentNo)))
            .thenThrow(tException),
        build: () => accountCubit,
        act: (cubit) => cubit.fetchStudentInformation(),
        expect: () => <AccountState>[
              const AccountState(status: Status.loading),
              AccountState(status: Status.failure, exception: tException)
            ],
        verify: (cubit) async {
          verify(() => mockStudentRepository.getUserInf(cubit.studentNo))
              .called(1);
        });
  });
}
