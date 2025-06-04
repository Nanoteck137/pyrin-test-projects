// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LelBody _$LelBodyFromJson(Map<String, dynamic> json) => LelBody(
  username: json['username'] as String?,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
);

Map<String, dynamic> _$LelBodyToJson(LelBody instance) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};

Test2Body _$Test2BodyFromJson(Map<String, dynamic> json) => Test2Body(
  bid: json['id'] as String,
  name: json['name'] as String,
  lastName: json['lastName'] as String,
  age: (json['age'] as num).toInt(),
);

Map<String, dynamic> _$Test2BodyToJson(Test2Body instance) => <String, dynamic>{
  'id': instance.bid,
  'name': instance.name,
  'lastName': instance.lastName,
  'age': instance.age,
};
