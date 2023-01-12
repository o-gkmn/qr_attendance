import 'package:flutter/cupertino.dart';
import 'package:qr_attendance/api/api.dart';
import 'package:qr_attendance/app/app.dart';

void main(List<String> args) {
  LocalJsonApi jsonApi = LocalJsonApi();
  StudentRepository studentRepository = StudentRepository(studentApi: jsonApi);
  runApp(App(studentRepository: studentRepository));
}