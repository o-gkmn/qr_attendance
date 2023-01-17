import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_attendance/api/api.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final String studentNo;

  AttendanceCubit(
      {required StudentRepository studentRepository, required this.studentNo})
      : _studentRepository = studentRepository,
        super(AttendanceInitial());

  final StudentRepository _studentRepository;

  void emitStudentInfo() async {
    /**
     * This function gets user information and student's lessons information from repository
     * After that emittin AttendanceLoaded state
     */
      GeneralUserInf generalUserInf = await _studentRepository.getUserInf(studentNo);
      StudentsLessonsInf studentsLessonsInf = await _studentRepository.getPastLessons(studentNo);
      emit(AttendanceLoaded(generalUserInf: generalUserInf, studentsLessonsInf: studentsLessonsInf));
  }

  void deleteLessons() async {
    /**
     * This function was deleted all past lessons and dates
     * First of all we will emit another state because we will reinitialize studentsLessonsInf
     * After that we called deleteAllPastLessons method from _studentsRepository
     * Finally we emit again StudentInfo
     */
    emit(AttendanceDelete());
    await _studentRepository.deleteAllPastLessons(studentNo);
    emitStudentInfo();
  }
}
