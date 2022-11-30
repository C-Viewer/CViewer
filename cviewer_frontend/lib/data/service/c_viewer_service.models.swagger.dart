// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'c_viewer_service.enums.swagger.dart' as enums;

part 'c_viewer_service.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Cv {
  Cv({
    this.id,
    this.name,
    this.peopleCreatedId,
    this.specialization,
    this.description,
    this.rating,
    this.tags,
  });

  factory Cv.fromJson(Map<String, dynamic> json) => _$CvFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'peopleCreatedId')
  final int? peopleCreatedId;
  @JsonKey(
    name: 'specialization',
    toJson: specializationToJson,
    fromJson: specializationFromJson,
  )
  final enums.Specialization? specialization;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'rating')
  final double? rating;
  @JsonKey(
    name: 'tags',
    toJson: cVTagListToJson,
    fromJson: cVTagListFromJson,
  )
  final List<enums.CVTag>? tags;
  static const fromJsonFactory = _$CvFromJson;
  static const toJsonFactory = _$CvToJson;
  Map<String, dynamic> toJson() => _$CvToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Cv &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.peopleCreatedId, peopleCreatedId) ||
                const DeepCollectionEquality()
                    .equals(other.peopleCreatedId, peopleCreatedId)) &&
            (identical(other.specialization, specialization) ||
                const DeepCollectionEquality()
                    .equals(other.specialization, specialization)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(peopleCreatedId) ^
      const DeepCollectionEquality().hash(specialization) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(tags) ^
      runtimeType.hashCode;
}

extension $CvExtension on Cv {
  Cv copyWith(
      {int? id,
      String? name,
      int? peopleCreatedId,
      enums.Specialization? specialization,
      String? description,
      double? rating,
      List<enums.CVTag>? tags}) {
    return Cv(
        id: id ?? this.id,
        name: name ?? this.name,
        peopleCreatedId: peopleCreatedId ?? this.peopleCreatedId,
        specialization: specialization ?? this.specialization,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        tags: tags ?? this.tags);
  }

  Cv copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<int?>? peopleCreatedId,
      Wrapped<enums.Specialization?>? specialization,
      Wrapped<String?>? description,
      Wrapped<double?>? rating,
      Wrapped<List<enums.CVTag>?>? tags}) {
    return Cv(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        peopleCreatedId: (peopleCreatedId != null
            ? peopleCreatedId.value
            : this.peopleCreatedId),
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        description:
            (description != null ? description.value : this.description),
        rating: (rating != null ? rating.value : this.rating),
        tags: (tags != null ? tags.value : this.tags));
  }
}

@JsonSerializable(explicitToJson: true)
class Profile {
  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.password,
    this.emailAddress,
    this.biography,
    this.isReviewer,
    this.specializationId,
    this.rating,
    this.userRole,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'emailAddress')
  final String? emailAddress;
  @JsonKey(name: 'biography')
  final String? biography;
  @JsonKey(name: 'isReviewer')
  final bool? isReviewer;
  @JsonKey(name: 'specializationId')
  final int? specializationId;
  @JsonKey(name: 'rating')
  final double? rating;
  @JsonKey(
    name: 'userRole',
    toJson: userRoleToJson,
    fromJson: userRoleFromJson,
  )
  final enums.UserRole? userRole;
  static const fromJsonFactory = _$ProfileFromJson;
  static const toJsonFactory = _$ProfileToJson;
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Profile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.biography, biography) ||
                const DeepCollectionEquality()
                    .equals(other.biography, biography)) &&
            (identical(other.isReviewer, isReviewer) ||
                const DeepCollectionEquality()
                    .equals(other.isReviewer, isReviewer)) &&
            (identical(other.specializationId, specializationId) ||
                const DeepCollectionEquality()
                    .equals(other.specializationId, specializationId)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.userRole, userRole) ||
                const DeepCollectionEquality()
                    .equals(other.userRole, userRole)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(biography) ^
      const DeepCollectionEquality().hash(isReviewer) ^
      const DeepCollectionEquality().hash(specializationId) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(userRole) ^
      runtimeType.hashCode;
}

extension $ProfileExtension on Profile {
  Profile copyWith(
      {int? id,
      String? firstName,
      String? lastName,
      String? password,
      String? emailAddress,
      String? biography,
      bool? isReviewer,
      int? specializationId,
      double? rating,
      enums.UserRole? userRole}) {
    return Profile(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        emailAddress: emailAddress ?? this.emailAddress,
        biography: biography ?? this.biography,
        isReviewer: isReviewer ?? this.isReviewer,
        specializationId: specializationId ?? this.specializationId,
        rating: rating ?? this.rating,
        userRole: userRole ?? this.userRole);
  }

  Profile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? password,
      Wrapped<String?>? emailAddress,
      Wrapped<String?>? biography,
      Wrapped<bool?>? isReviewer,
      Wrapped<int?>? specializationId,
      Wrapped<double?>? rating,
      Wrapped<enums.UserRole?>? userRole}) {
    return Profile(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        password: (password != null ? password.value : this.password),
        emailAddress:
            (emailAddress != null ? emailAddress.value : this.emailAddress),
        biography: (biography != null ? biography.value : this.biography),
        isReviewer: (isReviewer != null ? isReviewer.value : this.isReviewer),
        specializationId: (specializationId != null
            ? specializationId.value
            : this.specializationId),
        rating: (rating != null ? rating.value : this.rating),
        userRole: (userRole != null ? userRole.value : this.userRole));
  }
}

@JsonSerializable(explicitToJson: true)
class UserCredentials {
  UserCredentials({
    this.emailAddress,
    this.password,
  });

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsFromJson(json);

  @JsonKey(name: 'emailAddress')
  final String? emailAddress;
  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$UserCredentialsFromJson;
  static const toJsonFactory = _$UserCredentialsToJson;
  Map<String, dynamic> toJson() => _$UserCredentialsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserCredentials &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $UserCredentialsExtension on UserCredentials {
  UserCredentials copyWith({String? emailAddress, String? password}) {
    return UserCredentials(
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password);
  }

  UserCredentials copyWithWrapped(
      {Wrapped<String?>? emailAddress, Wrapped<String?>? password}) {
    return UserCredentials(
        emailAddress:
            (emailAddress != null ? emailAddress.value : this.emailAddress),
        password: (password != null ? password.value : this.password));
  }
}

int? cVTagToJson(enums.CVTag? cVTag) {
  return enums.$CVTagMap[cVTag];
}

enums.CVTag cVTagFromJson(
  Object? cVTag, [
  enums.CVTag? defaultValue,
]) {
  if (cVTag is int) {
    return enums.$CVTagMap.entries
        .firstWhere((element) => element.value == cVTag,
            orElse: () =>
                const MapEntry(enums.CVTag.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$CVTagMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ?? defaultValue ?? enums.CVTag.swaggerGeneratedUnknown;
}

List<int> cVTagListToJson(List<enums.CVTag>? cVTag) {
  if (cVTag == null) {
    return [];
  }

  return cVTag.map((e) => enums.$CVTagMap[e]!).toList();
}

List<enums.CVTag> cVTagListFromJson(
  List? cVTag, [
  List<enums.CVTag>? defaultValue,
]) {
  if (cVTag == null) {
    return defaultValue ?? [];
  }

  return cVTag.map((e) => cVTagFromJson(e.toString())).toList();
}

List<enums.CVTag>? cVTagNullableListFromJson(
  List? cVTag, [
  List<enums.CVTag>? defaultValue,
]) {
  if (cVTag == null) {
    return defaultValue;
  }

  return cVTag.map((e) => cVTagFromJson(e.toString())).toList();
}

int? specializationToJson(enums.Specialization? specialization) {
  return enums.$SpecializationMap[specialization];
}

enums.Specialization specializationFromJson(
  Object? specialization, [
  enums.Specialization? defaultValue,
]) {
  if (specialization is int) {
    return enums.$SpecializationMap.entries
        .firstWhere((element) => element.value == specialization,
            orElse: () =>
                const MapEntry(enums.Specialization.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$SpecializationMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.Specialization.swaggerGeneratedUnknown;
}

List<int> specializationListToJson(List<enums.Specialization>? specialization) {
  if (specialization == null) {
    return [];
  }

  return specialization.map((e) => enums.$SpecializationMap[e]!).toList();
}

List<enums.Specialization> specializationListFromJson(
  List? specialization, [
  List<enums.Specialization>? defaultValue,
]) {
  if (specialization == null) {
    return defaultValue ?? [];
  }

  return specialization
      .map((e) => specializationFromJson(e.toString()))
      .toList();
}

List<enums.Specialization>? specializationNullableListFromJson(
  List? specialization, [
  List<enums.Specialization>? defaultValue,
]) {
  if (specialization == null) {
    return defaultValue;
  }

  return specialization
      .map((e) => specializationFromJson(e.toString()))
      .toList();
}

int? userRoleToJson(enums.UserRole? userRole) {
  return enums.$UserRoleMap[userRole];
}

enums.UserRole userRoleFromJson(
  Object? userRole, [
  enums.UserRole? defaultValue,
]) {
  if (userRole is int) {
    return enums.$UserRoleMap.entries
        .firstWhere((element) => element.value == userRole,
            orElse: () =>
                const MapEntry(enums.UserRole.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$UserRoleMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ?? defaultValue ?? enums.UserRole.swaggerGeneratedUnknown;
}

List<int> userRoleListToJson(List<enums.UserRole>? userRole) {
  if (userRole == null) {
    return [];
  }

  return userRole.map((e) => enums.$UserRoleMap[e]!).toList();
}

List<enums.UserRole> userRoleListFromJson(
  List? userRole, [
  List<enums.UserRole>? defaultValue,
]) {
  if (userRole == null) {
    return defaultValue ?? [];
  }

  return userRole.map((e) => userRoleFromJson(e.toString())).toList();
}

List<enums.UserRole>? userRoleNullableListFromJson(
  List? userRole, [
  List<enums.UserRole>? defaultValue,
]) {
  if (userRole == null) {
    return defaultValue;
  }

  return userRole.map((e) => userRoleFromJson(e.toString())).toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
