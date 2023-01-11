import 'dart:convert';

import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/api/local_json_api/local_json_lapi_constants.dart';

import 'package:http/http.dart' as http;

class LocalJsonApi extends StudentApi {
  @override
  Future<UserLoginInf> controlUserLoginInf(String mail, String password) async {
    /** This function checks login information
     *  First of filtering according to mail and password
     *  Then get from url
     *  JsonDecode function returns a list
     *  If list is empty then user had entered wrong email or password
     *  Otherwise the first element of the list should be the user's information
     *  If status code different 200 then throws an exception
    */

    try {
      var url = Uri.parse(
          "$baseURL$userLoginInfEndpoint?stdMail=$mail&stdPass=$password");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List userList = jsonDecode(response.body);
        if (userList.isEmpty) {
          return const UserLoginInf.empty();
        }
        UserLoginInf student = UserLoginInf.fromJson(userList.first);
        return student;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAllPastLessons(String stdNo) {
    throw UnimplementedError();
  }

  @override
  Future<StudentsLessonsInf> getPastLessons(String stdNo) async {
    /**
     * This function get past lesson with date
     * StudentsLessonsInf has 3 list and 1 String data type
     * first of all we create a url and we get data
     * response.body decodes by jsonDecode and this function returns a list
     * then we convert to StudentsLessonInf object using .fromJson constructor
     */
    try {
      var url = Uri.parse("$baseURL$studentsLessonsInfEndpoint?stdNo=$stdNo");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List pastLessonsList = jsonDecode(response.body);
        if (pastLessonsList.isEmpty) {
          return StudentsLessonsInf.empty();
        }
        StudentsLessonsInf studentsLessonsInf =
            StudentsLessonsInf.fromJson(pastLessonsList.first);
        return studentsLessonsInf;
      }else{
        throw NotFoundException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GeneralUserInf> getUserInf(String stdNo) async {
    /**
     * This function get some data for students
     * name, surname, department etc.
     * First of all url parsed and get data using http
     * after then if status is 200 response body decodes by jsonDecode
     * we dont want a list what a created GetUserInf data
     * for this reason we get first element this list
     * anyway there will be only one item in the list
     * data must be corrupted if there are many items
     */
    try {
      var url = Uri.parse("$baseURL$generalUserInfEndpoint?stdNo=$stdNo");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List userInfList = jsonDecode(response.body);
        if (userInfList.isEmpty) {
          return const GeneralUserInf.empty();
        }
        GeneralUserInf generalUserInf =
            GeneralUserInf.fromJson(userInfList.first);
        return generalUserInf;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      rethrow;
    }
  }
}

class NotFoundException implements Exception {}
