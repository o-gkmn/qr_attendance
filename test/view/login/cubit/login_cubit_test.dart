import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_attendance/api/repository/student_repository.dart';
import 'package:qr_attendance/view/login/cubit/cubit.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  group("setStatusWaited", () {

  late MockStudentRepository mockStudentRepository;
  late LoginCubit loginCubit;

  setUp(() {
    mockStudentRepository = MockStudentRepository();
    loginCubit = LoginCubit(
        studentRepository: mockStudentRepository);
  });

    blocTest<LoginCubit, LoginState>(
      'emits [LoginAuthenticationWaiting] when setStatusWaited is called.',
      build: () => loginCubit,
      act: (bloc) => bloc.setStatusWaited(),
      expect: () => <LoginState>[LoginAuthenticationWaiting()],
    );
  },);
}