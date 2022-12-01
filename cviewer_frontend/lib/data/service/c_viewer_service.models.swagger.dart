// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'c_viewer_service.enums.swagger.dart' as enums;

part 'c_viewer_service.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class AttachedFile {
  AttachedFile({
    this.id,
    this.fileName,
    this.filePath,
  });

  factory AttachedFile.fromJson(Map<String, dynamic> json) =>
      _$AttachedFileFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'fileName')
  final String? fileName;
  @JsonKey(name: 'filePath')
  final String? filePath;
  static const fromJsonFactory = _$AttachedFileFromJson;
  static const toJsonFactory = _$AttachedFileToJson;
  Map<String, dynamic> toJson() => _$AttachedFileToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AttachedFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.filePath, filePath) ||
                const DeepCollectionEquality()
                    .equals(other.filePath, filePath)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(filePath) ^
      runtimeType.hashCode;
}

extension $AttachedFileExtension on AttachedFile {
  AttachedFile copyWith({int? id, String? fileName, String? filePath}) {
    return AttachedFile(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        filePath: filePath ?? this.filePath);
  }

  AttachedFile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? fileName,
      Wrapped<String?>? filePath}) {
    return AttachedFile(
        id: (id != null ? id.value : this.id),
        fileName: (fileName != null ? fileName.value : this.fileName),
        filePath: (filePath != null ? filePath.value : this.filePath));
  }
}

@JsonSerializable(explicitToJson: true)
class Cv {
  Cv({
    this.id,
    this.title,
    this.peopleCreatedId,
    this.specialization,
    this.description,
    this.rating,
    this.tags,
    this.dateCreation,
  });

  factory Cv.fromJson(Map<String, dynamic> json) => _$CvFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
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
  @JsonKey(name: 'dateCreation')
  final DateTime? dateCreation;
  static const fromJsonFactory = _$CvFromJson;
  static const toJsonFactory = _$CvToJson;
  Map<String, dynamic> toJson() => _$CvToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Cv &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
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
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.dateCreation, dateCreation) ||
                const DeepCollectionEquality()
                    .equals(other.dateCreation, dateCreation)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(peopleCreatedId) ^
      const DeepCollectionEquality().hash(specialization) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(dateCreation) ^
      runtimeType.hashCode;
}

extension $CvExtension on Cv {
  Cv copyWith(
      {int? id,
      String? title,
      int? peopleCreatedId,
      enums.Specialization? specialization,
      String? description,
      double? rating,
      List<enums.CVTag>? tags,
      DateTime? dateCreation}) {
    return Cv(
        id: id ?? this.id,
        title: title ?? this.title,
        peopleCreatedId: peopleCreatedId ?? this.peopleCreatedId,
        specialization: specialization ?? this.specialization,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        tags: tags ?? this.tags,
        dateCreation: dateCreation ?? this.dateCreation);
  }

  Cv copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? title,
      Wrapped<int?>? peopleCreatedId,
      Wrapped<enums.Specialization?>? specialization,
      Wrapped<String?>? description,
      Wrapped<double?>? rating,
      Wrapped<List<enums.CVTag>?>? tags,
      Wrapped<DateTime?>? dateCreation}) {
    return Cv(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        peopleCreatedId: (peopleCreatedId != null
            ? peopleCreatedId.value
            : this.peopleCreatedId),
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        description:
            (description != null ? description.value : this.description),
        rating: (rating != null ? rating.value : this.rating),
        tags: (tags != null ? tags.value : this.tags),
        dateCreation:
            (dateCreation != null ? dateCreation.value : this.dateCreation));
  }
}

@JsonSerializable(explicitToJson: true)
class CVHistory {
  CVHistory({
    this.id,
    this.attachedFileId,
    this.cvId,
    this.amazonPathToFile,
    this.applicantComment,
    this.expertComment,
    this.grade,
    this.dateTime,
  });

  factory CVHistory.fromJson(Map<String, dynamic> json) =>
      _$CVHistoryFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'attachedFileId')
  final int? attachedFileId;
  @JsonKey(name: 'cvId')
  final int? cvId;
  @JsonKey(name: 'amazonPathToFile')
  final String? amazonPathToFile;
  @JsonKey(name: 'applicantComment')
  final String? applicantComment;
  @JsonKey(name: 'expertComment')
  final String? expertComment;
  @JsonKey(name: 'grade')
  final double? grade;
  @JsonKey(name: 'dateTime')
  final DateTime? dateTime;
  static const fromJsonFactory = _$CVHistoryFromJson;
  static const toJsonFactory = _$CVHistoryToJson;
  Map<String, dynamic> toJson() => _$CVHistoryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CVHistory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.attachedFileId, attachedFileId) ||
                const DeepCollectionEquality()
                    .equals(other.attachedFileId, attachedFileId)) &&
            (identical(other.cvId, cvId) ||
                const DeepCollectionEquality().equals(other.cvId, cvId)) &&
            (identical(other.amazonPathToFile, amazonPathToFile) ||
                const DeepCollectionEquality()
                    .equals(other.amazonPathToFile, amazonPathToFile)) &&
            (identical(other.applicantComment, applicantComment) ||
                const DeepCollectionEquality()
                    .equals(other.applicantComment, applicantComment)) &&
            (identical(other.expertComment, expertComment) ||
                const DeepCollectionEquality()
                    .equals(other.expertComment, expertComment)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(attachedFileId) ^
      const DeepCollectionEquality().hash(cvId) ^
      const DeepCollectionEquality().hash(amazonPathToFile) ^
      const DeepCollectionEquality().hash(applicantComment) ^
      const DeepCollectionEquality().hash(expertComment) ^
      const DeepCollectionEquality().hash(grade) ^
      const DeepCollectionEquality().hash(dateTime) ^
      runtimeType.hashCode;
}

extension $CVHistoryExtension on CVHistory {
  CVHistory copyWith(
      {int? id,
      int? attachedFileId,
      int? cvId,
      String? amazonPathToFile,
      String? applicantComment,
      String? expertComment,
      double? grade,
      DateTime? dateTime}) {
    return CVHistory(
        id: id ?? this.id,
        attachedFileId: attachedFileId ?? this.attachedFileId,
        cvId: cvId ?? this.cvId,
        amazonPathToFile: amazonPathToFile ?? this.amazonPathToFile,
        applicantComment: applicantComment ?? this.applicantComment,
        expertComment: expertComment ?? this.expertComment,
        grade: grade ?? this.grade,
        dateTime: dateTime ?? this.dateTime);
  }

  CVHistory copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? attachedFileId,
      Wrapped<int?>? cvId,
      Wrapped<String?>? amazonPathToFile,
      Wrapped<String?>? applicantComment,
      Wrapped<String?>? expertComment,
      Wrapped<double?>? grade,
      Wrapped<DateTime?>? dateTime}) {
    return CVHistory(
        id: (id != null ? id.value : this.id),
        attachedFileId: (attachedFileId != null
            ? attachedFileId.value
            : this.attachedFileId),
        cvId: (cvId != null ? cvId.value : this.cvId),
        amazonPathToFile: (amazonPathToFile != null
            ? amazonPathToFile.value
            : this.amazonPathToFile),
        applicantComment: (applicantComment != null
            ? applicantComment.value
            : this.applicantComment),
        expertComment:
            (expertComment != null ? expertComment.value : this.expertComment),
        grade: (grade != null ? grade.value : this.grade),
        dateTime: (dateTime != null ? dateTime.value : this.dateTime));
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
