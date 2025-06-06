// DO NOT EDIT THIS: This file was generated by the Pyrin Dart Generator
import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

@JsonSerializable()
class LelBody {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "confirmPassword")
  final String confirmPassword;

  LelBody({this.username, required this.password, required this.confirmPassword});

  factory LelBody.fromJson(Map<String, dynamic> json) => _$LelBodyFromJson(json);
  Map<String, dynamic> toJson() => _$LelBodyToJson(this);
}

@JsonSerializable()
class Test2Body {
  @JsonKey(name: "id")
  final String bid;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "age")
  final int age;

  Test2Body({required this.bid, required this.name, required this.lastName, required this.age});

  factory Test2Body.fromJson(Map<String, dynamic> json) => _$Test2BodyFromJson(json);
  Map<String, dynamic> toJson() => _$Test2BodyToJson(this);
}

