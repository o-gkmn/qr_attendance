part of 'attendance_cubit.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final GeneralUserInf generalUserInf;
  final StudentsLessonsInf studentsLessonsInf;

  const AttendanceLoaded({required this.studentsLessonsInf, required this.generalUserInf});
}