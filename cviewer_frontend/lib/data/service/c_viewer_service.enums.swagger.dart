import 'package:json_annotation/json_annotation.dart';

enum CVTag {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue(0)
  value_0,
  @JsonValue(1)
  value_1,
  @JsonValue(2)
  value_2,
  @JsonValue(3)
  value_3
}

const $CVTagMap = {
  CVTag.value_0: 0,
  CVTag.value_1: 1,
  CVTag.value_2: 2,
  CVTag.value_3: 3
};

enum Specialization {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue(0)
  value_0,
  @JsonValue(1)
  value_1
}

const $SpecializationMap = {
  Specialization.value_0: 0,
  Specialization.value_1: 1
};

enum UserRole {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue(0)
  value_0,
  @JsonValue(1)
  value_1
}

const $UserRoleMap = {UserRole.value_0: 0, UserRole.value_1: 1};
