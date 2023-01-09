import 'package:qr_attendance/api/api.dart';

abstract class StudentApi{

  Future<UserLoginInf> controlUserLoginInf(String mail, String password);

  Future<GeneralUserInf> getUserInf(String stdNo);

  Future<StudentsLessonsInf> getPastLessons(String stdNo);

  Future<void> deleteAllPastLessons(String stdNo);
}