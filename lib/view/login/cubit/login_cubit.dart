import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_attendance/api/api.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final StudentRepository _studentRepository;

  LoginCubit({required StudentRepository studentRepository})
      : _studentRepository = studentRepository,
        super(const LoginState(status: LoginStatus.initial));

  authentication(String mail, String pass) async {
    /**
     * This function verifies user login informations
     * We controls information with api's controlUserLoginInf function
     * then if stdNo is empty login is failed
     * if stdNo isn't empty then should be success
     */
    UserLoginInf userLoginInf;
    try {
      userLoginInf = await _studentRepository.controlUserLoginInf(mail, pass);
    } catch (e) {
      emit(LoginState(status: LoginStatus.error, exception: e as Exception));
      return;
    }

    if (userLoginInf.stdNo.isEmpty) {
      emit(const LoginState(status: LoginStatus.denied));
    }
    if (userLoginInf.stdNo.isNotEmpty) {
      emit(LoginState(
          status: LoginStatus.confirmed, userLoginInf: userLoginInf));
    }
  }

  setStatusInital() => emit(const LoginState(status: LoginStatus.initial));
}
