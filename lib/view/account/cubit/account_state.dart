part of 'account_cubit.dart';

class AccountState extends Equatable {
  const AccountState(
      {required this.status,
      this.studentInformation = const GeneralUserInf.empty(),
      this.exception});

  final Status status;
  final GeneralUserInf studentInformation;
  final Exception? exception;

  AccountState copyWith(
      {Status? status,
      GeneralUserInf? studentInformation,
      Exception? exception}) {
    return AccountState(
        status: status ?? this.status,
        studentInformation: studentInformation ?? this.studentInformation,
        exception: exception ?? this.exception);
  }

  @override
  List<Object> get props => [status, studentInformation];
}
