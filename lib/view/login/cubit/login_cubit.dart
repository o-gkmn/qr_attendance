import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_attendance/api/api.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final StudentRepository _studentRepository;

  LoginCubit({required StudentRepository studentRepository})
      : _studentRepository = studentRepository,
        super(LoginInitial());

  authentication(String mail, String pass) async {
    /**
     * This function verifies user login informations
     * We controls information with api's controlUserLoginInf function
     * then if stdNo is empty login is failed
     * if stdNo isn't empty then should be success
     */
    UserLoginInf userLoginInf = await _studentRepository.controlUserLoginInf(mail, pass);
    if(userLoginInf.stdNo.isEmpty){
      emit(LoginAuthenticationFailed());
    }
    if(userLoginInf.stdNo.isNotEmpty){
      emit(LoginAuthenticationSucced(userLoginInf: userLoginInf));
    }
  }

  setStatusWaited() => emit(LoginAuthenticationWaiting());
}
