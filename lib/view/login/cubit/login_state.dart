part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginAuthenticationWaiting extends LoginState {}

class LoginAuthenticationSucced extends LoginState {
  final UserLoginInf userLoginInf;

  const LoginAuthenticationSucced({required this.userLoginInf});
}

class LoginAuthenticationFailed extends LoginState {}

class LoginError extends LoginState {}
