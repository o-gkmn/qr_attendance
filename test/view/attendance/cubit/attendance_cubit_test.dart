import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/view/attendance/cubit/cubit.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  late MockStudentRepository mockStudentRepository;
  late AttendanceCubit attendanceCubit;

  setUp(() {
    mockStudentRepository = MockStudentRepository();
    attendanceCubit = AttendanceCubit(
        studentRepository: mockStudentRepository, studentNo: "200404006");
  });

  group("fetchStudentInfoAndLessonsData", () {
    const GeneralUserInf generalUserInf = GeneralUserInf(
        name: "name",
        surname: "surname",
        stdNo: "200404006",
        faculty: "faculty",
        department: "department",
        stdClass: "stdClass");
    const StudentsLessonsInf studentsLessonsInf = StudentsLessonsInf(
        stdNo: "200404006",
        lessonsLearned: <String>["a"],
        pastLessons: <String>["b"],
        date: <String>["c"]);

    final Exception tException = Exception('Failed to fetch goals.');

    blocTest<AttendanceCubit, AttendanceState>(
      'emits [Status.loading, Status.succes] when fetchStudentInfoAndLessonsData is called succesfully.',
      setUp: () {
        when(() => mockStudentRepository.getUserInf(attendanceCubit.studentNo))
            .thenAnswer((_) async => generalUserInf);
        when(() =>
                mockStudentRepository.getPastLessons(attendanceCubit.studentNo))
            .thenAnswer((_) async => studentsLessonsInf);
      },
      build: () => attendanceCubit,
      act: (cubit) => cubit.fetchStudentInfoAndLessonsData(),
      expect: () => const <AttendanceState>[
        AttendanceState(status: Status.loading),
        AttendanceState(
            status: Status.succes,
            studentInformation: generalUserInf,
            studentLessonsInformation: studentsLessonsInf)
      ],
      verify: (cubit) {
        verify(() => mockStudentRepository.getPastLessons(cubit.studentNo))
            .called(1);
        verify(() => mockStudentRepository.getUserInf(cubit.studentNo))
            .called(1);
      },
    );

    blocTest<AttendanceCubit, AttendanceState>(
      'emits [Status.loading, Status.failure] when mockStudentRepository.getPastLessons is failed in fetchStudentInfoAndLessonsData.',
      setUp: () {
        when(() => mockStudentRepository.getUserInf(attendanceCubit.studentNo))
            .thenAnswer((invocation) async => generalUserInf);
        when(() =>
                mockStudentRepository.getPastLessons(attendanceCubit.studentNo))
            .thenThrow(tException);
      },
      build: () => attendanceCubit,
      act: (cubit) => cubit.fetchStudentInfoAndLessonsData(),
      expect: () => <AttendanceState>[
        const AttendanceState(status: Status.loading),
        AttendanceState(status: Status.failure, exception: tException)
      ],
      verify: (cubit) {
        verify(() => mockStudentRepository.getPastLessons(cubit.studentNo))
            .called(1);
        verify(() => mockStudentRepository.getUserInf(cubit.studentNo))
            .called(1);
      },
    );

    blocTest<AttendanceCubit, AttendanceState>(
      'emits [Status.loading, Status.failure] when mockStudentRepository.getUserInf is failed in fetchStudentInfoAndLessonsData.',
      setUp: () {
        when(() =>
                mockStudentRepository.getPastLessons(attendanceCubit.studentNo))
            .thenAnswer((_) async => studentsLessonsInf);
        when(() => mockStudentRepository.getUserInf(attendanceCubit.studentNo))
            .thenThrow(tException);
      },
      build: () => attendanceCubit,
      act: (cubit) => cubit.fetchStudentInfoAndLessonsData(),
      expect: () => <AttendanceState>[
        const AttendanceState(status: Status.loading),
        AttendanceState(status: Status.failure, exception: tException)
      ],
      verify: (cubit) {
        verifyNever(() => mockStudentRepository.getPastLessons(cubit.studentNo))
            .called(0);
        verify(() => mockStudentRepository.getUserInf(cubit.studentNo))
            .called(1);
      },
    );
  });
}
