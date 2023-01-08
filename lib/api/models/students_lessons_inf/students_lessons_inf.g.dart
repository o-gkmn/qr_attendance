// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_lessons_inf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsLessonsInf _$StudentsLessonsInfFromJson(Map<String, dynamic> json) =>
    StudentsLessonsInf(
      stdNo: json['stdNo'] as String,
      lessonsLearned: (json['lessonsLearned'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pastLessons: (json['pastLessons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      date: (json['date'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StudentsLessonsInfToJson(StudentsLessonsInf instance) =>
    <String, dynamic>{
      'stdNo': instance.stdNo,
      'lessonsLearned': instance.lessonsLearned,
      'pastLessons': instance.pastLessons,
      'date': instance.date,
    };
