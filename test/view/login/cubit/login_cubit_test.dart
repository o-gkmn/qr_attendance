import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/view/login/cubit/cubit.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  late MockStudentRepository mockStudentRepository;
  late LoginCubit loginCubit;

  setUp(() {
    mockStudentRepository = MockStudentRepository();
    loginCubit = LoginCubit(studentRepository: mockStudentRepository);
  });

  group(
    "authentication",
    () {
      const userLoginInf = UserLoginInf(
          stdNo: "200404006",
          stdMail: "200404006@st.biruni.edu.tr",
          stdPass: "gpyQ3C3K");

      Exception exception = Exception();

      blocTest<LoginCubit, LoginState>(
        'emits [LoginStatus.confirmed] when authentication is succesfully.',
        setUp: () {
          when(() => mockStudentRepository.controlUserLoginInf(
                  userLoginInf.stdMail, userLoginInf.stdPass))
              .thenAnswer((_) async => userLoginInf);
        },
        build: () => loginCubit,
        act: (cubit) =>
            cubit.authentication(userLoginInf.stdMail, userLoginInf.stdPass),
        expect: () => const <LoginState>[
          LoginState(status: LoginStatus.confirmed, userLoginInf: userLoginInf)
        ],
        verify: (_) {
          verify(() => mockStudentRepository.controlUserLoginInf(
              userLoginInf.stdMail, userLoginInf.stdPass)).called(1);
        },
      );

      blocTest<LoginCubit, LoginState>(
        'emits [LoginStatus.denied] when authentication is failure.',
        setUp: () {
          when(() => mockStudentRepository.controlUserLoginInf(
                  userLoginInf.stdMail, userLoginInf.stdPass))
              .thenAnswer((_) async => const UserLoginInf.empty());
        },
        build: () => loginCubit,
        act: (cubit) =>
            cubit.authentication(userLoginInf.stdMail, userLoginInf.stdPass),
        expect: () =>
            <LoginState>[const LoginState(status: LoginStatus.denied)],
        verify: (cubit) {
          verify(() => mockStudentRepository.controlUserLoginInf(
              userLoginInf.stdMail, userLoginInf.stdPass)).called(1);
        },
      );

      blocTest(
        "emits [LoginStatus.error] when authentication is throws an error",
        setUp: () {
          when(() => mockStudentRepository.controlUserLoginInf(any(), any())).thenThrow(exception);
        },
        build: () => loginCubit,
        act: (cubit) => cubit.authentication(userLoginInf.stdMail, userLoginInf.stdPass),
        expect: () => <LoginState>[LoginState(status: LoginStatus.error, exception: exception)],
        verify: (cubit) {
          verify(() => mockStudentRepository.controlUserLoginInf(any(), any())).called(1);
        },
      );
    },
  );

  group(
    "setStatusInitial",
    () {
      blocTest<LoginCubit, LoginState>(
        'emits [LoginStatus.initial] when setStatusInitial is called.',
        build: () => loginCubit,
        act: (cubit) => cubit.setStatusInital(),
        expect: () =>
            <LoginState>[const LoginState(status: LoginStatus.initial)],
      );
    },
  );
}
