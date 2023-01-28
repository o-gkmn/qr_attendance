part of 'login_cubit.dart';

enum LoginStatus { initial, confirmed, denied, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final UserLoginInf userLoginInf;
  final Exception? exception;

  const LoginState(
      {required this.status,
      this.userLoginInf = const UserLoginInf.empty(),
      this.exception});

  @override
  List<Object> get props => [status, userLoginInf];
}
