import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_attendance/api/api.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final String studentNo;

  AttendanceCubit(
      {required StudentRepository studentRepository, required this.studentNo})
      : _studentRepository = studentRepository,
        super(const AttendanceState(status: Status.inital));

  final StudentRepository _studentRepository;

  void fetchStudentInfoAndLessonsData() async {
    /**
     * This function gets user information and student's lessons information from repository
     */
    emit(state.copyWith(status: Status.loading));

    try {
      GeneralUserInf generalUserInf =
          await _studentRepository.getUserInf(studentNo);
      StudentsLessonsInf studentsLessonsInf =
          await _studentRepository.getPastLessons(studentNo);
      emit(state.copyWith(
          status: Status.succes,
          studentInformation: generalUserInf,
          studentLessonsInformation: studentsLessonsInf));
    } on Exception catch (e) {
      emit(state.copyWith(status: Status.failure, exception: e));
    }
  }

  void deleteLessons() async {
    /**
     * This function was deleted all past lessons and dates
     */
    await _studentRepository.deleteAllPastLessons(studentNo);
    fetchStudentInfoAndLessonsData();
  }

  void updateSort() {
    /**
     * This function sorts lesoons list
     */
    if(state.studentLessonsInformation.pastLessons.isEmpty){
      return;
    }
    List<String> resortedLessonsDate =
        state.studentLessonsInformation.date.reversed.toList();
    List<String> resortedLessons =
        state.studentLessonsInformation.pastLessons.reversed.toList();

    StudentsLessonsInf resortedStudentsLessonInf = state
        .studentLessonsInformation
        .copyWith(date: resortedLessonsDate, pastLessons: resortedLessons);

    emit(state.copyWith(studentLessonsInformation: resortedStudentsLessonInf));
  }
}
