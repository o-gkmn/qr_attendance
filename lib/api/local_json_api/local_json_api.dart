import 'dart:convert';

import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/api/local_json_api/local_json_lapi_constants.dart';

import 'package:http/http.dart' as http;

class LocalJsonApi extends StudentApi{

  @override
  Future<UserLoginInf> controlUserLoginInf(String mail, String password) async {
    /** This function checks login information
     *  First of filtering according to mail and password
     *  then get from url
     *  jsonDecode function returns a list
     *  if list is empty then user had entered wrong email or password
     *  otherwise the first element of the list should be the user's information
     * if status code different 200 then throws an exception
    */

    try{
      var url = Uri.parse("$baseURL$userLoginInfEndpoint?stdMail=$mail&stdPass=$password");
      var response = await http.get(url);

      if(response.statusCode == 200){
        List userList = jsonDecode(response.body);
        if(userList.isEmpty){
          return const UserLoginInf.empty();
        }
        UserLoginInf student = UserLoginInf.fromJson(userList.first);
        return student;
      }else{
        throw NotFoundException();
      }
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<void> deleteAllPastLessons(String stdNo) {
    throw UnimplementedError();
  }

  @override
  Future<StudentsLessonsInf> getPastLessons(String stdNo) {
    throw UnimplementedError();
  }

  @override
  Future<GeneralUserInf> getUserInf(String stdNo) {
    throw UnimplementedError();
  }
}

class NotFoundException implements Exception{}