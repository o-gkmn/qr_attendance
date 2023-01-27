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

      blocTest<LoginCubit, LoginState>(
        'emits [LoginAuthenticationSucced] when authentication is succesfully.',
        setUp: () {
          when(() => mockStudentRepository.controlUserLoginInf(
                  userLoginInf.stdMail, userLoginInf.stdPass))
              .thenAnswer((_) async => userLoginInf);
        },
        build: () => loginCubit,
        act: (cubit) =>
            cubit.authentication(userLoginInf.stdMail, userLoginInf.stdPass),
        expect: () => const <LoginState>[
          LoginAuthenticationSucced(userLoginInf: userLoginInf)
        ],
        verify: (_) {
          verify(() => mockStudentRepository.controlUserLoginInf(
              userLoginInf.stdMail, userLoginInf.stdPass)).called(1);
        },
      );

      blocTest<LoginCubit, LoginState>(
        'emits [LoginAuthenticationFailed] when authentication is failure.',
        setUp: () {
          when(() => mockStudentRepository.controlUserLoginInf(
                  userLoginInf.stdMail, userLoginInf.stdPass))
              .thenAnswer((_) async => const UserLoginInf.empty());
        },
        build: () => loginCubit,
        act: (cubit) =>
            cubit.authentication(userLoginInf.stdMail, userLoginInf.stdPass),
        expect: () => <LoginState>[LoginAuthenticationFailed()],
        verify: (cubit) {
          verify(() => mockStudentRepository.controlUserLoginInf(
              userLoginInf.stdMail, userLoginInf.stdPass)).called(1);
        },
      );
    },
  );

  group(
    "setStatusWaited",
    () {
      blocTest<LoginCubit, LoginState>(
        'emits [LoginAuthenticationWaiting] when setStatusWaited is called.',
        build: () => loginCubit,
        act: (bloc) => bloc.setStatusWaited(),
        expect: () => <LoginState>[LoginAuthenticationWaiting()],
      );
    },
  );
}
