import 'package:qr_attendance/api/api.dart';

class StudentRepository {
  const StudentRepository({required StudentApi studentApi}) : _studentApi = studentApi;

  final StudentApi _studentApi;

  Future<UserLoginInf> controlUserLoginInf(String email, String password) => _studentApi.controlUserLoginInf(email, password);

  Future<GeneralUserInf> getUserInf(String stdNo) => _studentApi.getUserInf(stdNo);

  Future<StudentsLessonsInf> getPastLessons(String stdNo) => _studentApi.getPastLessons(stdNo);

  Future<void> deleteAllPastLessons(String stdNo) => _studentApi.deleteAllPastLessons(stdNo);
}