import 'package:qr_attendance/api/api.dart';

class HabitRepository {
  const HabitRepository({required StudentApi studentApi}) : _studentApi = studentApi;

  final StudentApi _studentApi;

  Stream<List<UserLoginInf>> controlUserLoginInf() => _studentApi.controlUserLoginInf();

  Future<GeneralUserInf> getUserInf(String stdNo) => _studentApi.getUserInf(stdNo);

  Future<StudentsLessonsInf> getPastLessons(String stdNo) => _studentApi.getPastLessons(stdNo);

  Future<void> deleteAllPastLessons(String stdNo) => _studentApi.deleteAllPastLessons(stdNo);
}