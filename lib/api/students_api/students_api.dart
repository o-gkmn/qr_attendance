import 'package:qr_attendance/api/api.dart';

abstract class StudentApi{

  Stream<List<UserLoginInf>> controlUserLoginInf();

  Future<GeneralUserInf> getUserInf(String stdNo);

  Future<StudentsLessonsInf> getPastLessons(String stdNo);

  Future<void> deleteAllPastLessons(String stdNo);
}