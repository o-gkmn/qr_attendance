import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/view/attendance/attendance.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final StudentRepository _studentRepository;
  final String studentNo;

  AccountCubit({required this.studentNo, required studentRepository})
      : _studentRepository = studentRepository,
        super(const AccountState(status: Status.inital));

  void fetchStudentInformation() async {
    emit(state.copyWith(status: Status.loading));

    try {
      GeneralUserInf studentInformation =
          await _studentRepository.getUserInf(studentNo);
      emit(state.copyWith(
          status: Status.succes, studentInformation: studentInformation));
    } on Exception catch (e) {
      emit(state.copyWith(status:Status.failure, exception: e));
    }
  }
}
