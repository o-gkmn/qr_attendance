// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_user_inf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralUserInf _$GeneralUserInfFromJson(Map<String, dynamic> json) =>
    GeneralUserInf(
      name: json['name'] as String,
      surname: json['surname'] as String,
      stdNo: json['stdNo'] as String,
      faculty: json['faculty'] as String,
      department: json['department'] as String,
      stdClass: json['stdClass'] as String,
    );

Map<String, dynamic> _$GeneralUserInfToJson(GeneralUserInf instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'stdNo': instance.stdNo,
      'faculty': instance.faculty,
      'department': instance.department,
      'stdClass': instance.stdClass,
    };
