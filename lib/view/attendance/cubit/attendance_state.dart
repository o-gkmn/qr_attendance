part of 'attendance_cubit.dart';

enum Status { inital, loading, succes, failure }

class AttendanceState extends Equatable {
  const AttendanceState(
      {this.status = Status.inital,
      this.studentInformation = const GeneralUserInf.empty(),
      this.studentLessonsInformation = const StudentsLessonsInf.empty(),
      this.exception});

  final Status status;
  final GeneralUserInf studentInformation;
  final StudentsLessonsInf studentLessonsInformation;
  final Exception? exception;

  AttendanceState copyWith(
      {Status? status,
      GeneralUserInf? studentInformation,
      StudentsLessonsInf? studentLessonsInformation,
      Exception? exception}) {
    return AttendanceState(
        status: status ?? this.status,
        studentInformation: studentInformation ?? this.studentInformation,
        studentLessonsInformation:
            studentLessonsInformation ?? this.studentLessonsInformation,
        exception: exception ?? this.exception);
  }

  @override
  List<Object> get props => [status, studentInformation, studentLessonsInformation];
}
