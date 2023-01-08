import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login_inf.g.dart';

@JsonSerializable()
class UserLoginInf extends Equatable{
  final String stdNo;
  final String stdMail;
  final String stdPass;

  const UserLoginInf({required this.stdNo, required this.stdMail, required this.stdPass});

  factory UserLoginInf.fromJson(Map<String, dynamic> json) => _$UserLoginInfFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginInfToJson(this);

  @override
  List<Object?> get props => [stdMail, stdPass, stdNo];
}