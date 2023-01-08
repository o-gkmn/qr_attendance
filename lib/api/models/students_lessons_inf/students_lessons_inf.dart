import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'students_lessons_inf.g.dart';

@JsonSerializable()
class StudentsLessonsInf extends Equatable {
  final String stdNo;
  final List<String> lessonsLearned;
  final List<String> pastLessons;
  final List<String> date;

  const StudentsLessonsInf(
      {required this.stdNo,
      required this.lessonsLearned,
      required this.pastLessons,
      required this.date});

  factory StudentsLessonsInf.fromJson(Map<String, dynamic> json) => _$StudentsLessonsInfFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsLessonsInfToJson(this);

  @override
  List<Object?> get props => [stdNo, lessonsLearned, pastLessons, date];
}
