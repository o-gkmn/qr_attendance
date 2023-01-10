import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'general_user_inf.g.dart';

@JsonSerializable()
class GeneralUserInf extends Equatable {
  final String name;
  final String surname;
  final String stdNo;
  final String faculty;
  final String department;
  final String stdClass;

  const GeneralUserInf(
      {required this.name,
      required this.surname,
      required this.stdNo,
      required this.faculty,
      required this.department,
      required this.stdClass});

  const GeneralUserInf.empty()
      : name = "",
        surname = "",
        stdNo = "",
        faculty = "",
        department = "",
        stdClass = "";

  factory GeneralUserInf.fromJson(Map<String, dynamic> json) =>
      _$GeneralUserInfFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralUserInfToJson(this);

  @override
  List<Object?> get props =>
      [name, surname, stdNo, faculty, department, stdClass];
}
