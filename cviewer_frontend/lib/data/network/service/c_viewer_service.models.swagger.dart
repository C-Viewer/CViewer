// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

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
    this.expertIds,
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
  @JsonKey(name: 'expertIds', defaultValue: <int>[])
  final List<int>? expertIds;
  @JsonKey(name: 'specialization')
  final Specialization? specialization;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'rating')
  final double? rating;
  @JsonKey(name: 'tags', defaultValue: <CVTag>[])
  final List<CVTag>? tags;
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
            (identical(other.expertIds, expertIds) ||
                const DeepCollectionEquality()
                    .equals(other.expertIds, expertIds)) &&
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
      const DeepCollectionEquality().hash(expertIds) ^
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
      List<int>? expertIds,
      Specialization? specialization,
      String? description,
      double? rating,
      List<CVTag>? tags,
      DateTime? dateCreation}) {
    return Cv(
        id: id ?? this.id,
        title: title ?? this.title,
        peopleCreatedId: peopleCreatedId ?? this.peopleCreatedId,
        expertIds: expertIds ?? this.expertIds,
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
      Wrapped<List<int>?>? expertIds,
      Wrapped<Specialization?>? specialization,
      Wrapped<String?>? description,
      Wrapped<double?>? rating,
      Wrapped<List<CVTag>?>? tags,
      Wrapped<DateTime?>? dateCreation}) {
    return Cv(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        peopleCreatedId: (peopleCreatedId != null
            ? peopleCreatedId.value
            : this.peopleCreatedId),
        expertIds: (expertIds != null ? expertIds.value : this.expertIds),
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
    this.expertId,
    this.amazonPathToFile,
    this.comment,
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
  @JsonKey(name: 'expertId')
  final int? expertId;
  @JsonKey(name: 'amazonPathToFile')
  final String? amazonPathToFile;
  @JsonKey(name: 'comment')
  final String? comment;
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
            (identical(other.expertId, expertId) ||
                const DeepCollectionEquality()
                    .equals(other.expertId, expertId)) &&
            (identical(other.amazonPathToFile, amazonPathToFile) ||
                const DeepCollectionEquality()
                    .equals(other.amazonPathToFile, amazonPathToFile)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
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
      const DeepCollectionEquality().hash(expertId) ^
      const DeepCollectionEquality().hash(amazonPathToFile) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(grade) ^
      const DeepCollectionEquality().hash(dateTime) ^
      runtimeType.hashCode;
}

extension $CVHistoryExtension on CVHistory {
  CVHistory copyWith(
      {int? id,
      int? attachedFileId,
      int? cvId,
      int? expertId,
      String? amazonPathToFile,
      String? comment,
      double? grade,
      DateTime? dateTime}) {
    return CVHistory(
        id: id ?? this.id,
        attachedFileId: attachedFileId ?? this.attachedFileId,
        cvId: cvId ?? this.cvId,
        expertId: expertId ?? this.expertId,
        amazonPathToFile: amazonPathToFile ?? this.amazonPathToFile,
        comment: comment ?? this.comment,
        grade: grade ?? this.grade,
        dateTime: dateTime ?? this.dateTime);
  }

  CVHistory copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? attachedFileId,
      Wrapped<int?>? cvId,
      Wrapped<int?>? expertId,
      Wrapped<String?>? amazonPathToFile,
      Wrapped<String?>? comment,
      Wrapped<double?>? grade,
      Wrapped<DateTime?>? dateTime}) {
    return CVHistory(
        id: (id != null ? id.value : this.id),
        attachedFileId: (attachedFileId != null
            ? attachedFileId.value
            : this.attachedFileId),
        cvId: (cvId != null ? cvId.value : this.cvId),
        expertId: (expertId != null ? expertId.value : this.expertId),
        amazonPathToFile: (amazonPathToFile != null
            ? amazonPathToFile.value
            : this.amazonPathToFile),
        comment: (comment != null ? comment.value : this.comment),
        grade: (grade != null ? grade.value : this.grade),
        dateTime: (dateTime != null ? dateTime.value : this.dateTime));
  }
}

@JsonSerializable(explicitToJson: true)
class CVTag {
  CVTag({
    this.id,
    this.name,
  });

  factory CVTag.fromJson(Map<String, dynamic> json) => _$CVTagFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CVTagFromJson;
  static const toJsonFactory = _$CVTagToJson;
  Map<String, dynamic> toJson() => _$CVTagToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CVTag &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CVTagExtension on CVTag {
  CVTag copyWith({int? id, String? name}) {
    return CVTag(id: id ?? this.id, name: name ?? this.name);
  }

  CVTag copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? name}) {
    return CVTag(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
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
    this.isExpert,
    this.specializationId,
    this.rating,
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
  @JsonKey(name: 'isExpert')
  final bool? isExpert;
  @JsonKey(name: 'specializationId')
  final int? specializationId;
  @JsonKey(name: 'rating')
  final double? rating;
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
            (identical(other.isExpert, isExpert) ||
                const DeepCollectionEquality()
                    .equals(other.isExpert, isExpert)) &&
            (identical(other.specializationId, specializationId) ||
                const DeepCollectionEquality()
                    .equals(other.specializationId, specializationId)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)));
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
      const DeepCollectionEquality().hash(isExpert) ^
      const DeepCollectionEquality().hash(specializationId) ^
      const DeepCollectionEquality().hash(rating) ^
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
      bool? isExpert,
      int? specializationId,
      double? rating}) {
    return Profile(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        emailAddress: emailAddress ?? this.emailAddress,
        biography: biography ?? this.biography,
        isExpert: isExpert ?? this.isExpert,
        specializationId: specializationId ?? this.specializationId,
        rating: rating ?? this.rating);
  }

  Profile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? password,
      Wrapped<String?>? emailAddress,
      Wrapped<String?>? biography,
      Wrapped<bool?>? isExpert,
      Wrapped<int?>? specializationId,
      Wrapped<double?>? rating}) {
    return Profile(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        password: (password != null ? password.value : this.password),
        emailAddress:
            (emailAddress != null ? emailAddress.value : this.emailAddress),
        biography: (biography != null ? biography.value : this.biography),
        isExpert: (isExpert != null ? isExpert.value : this.isExpert),
        specializationId: (specializationId != null
            ? specializationId.value
            : this.specializationId),
        rating: (rating != null ? rating.value : this.rating));
  }
}

@JsonSerializable(explicitToJson: true)
class Specialization {
  Specialization({
    this.id,
    this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$SpecializationFromJson;
  static const toJsonFactory = _$SpecializationToJson;
  Map<String, dynamic> toJson() => _$SpecializationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Specialization &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $SpecializationExtension on Specialization {
  Specialization copyWith({int? id, String? name}) {
    return Specialization(id: id ?? this.id, name: name ?? this.name);
  }

  Specialization copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? name}) {
    return Specialization(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class TransitObjectForUpdateCVInfo {
  TransitObjectForUpdateCVInfo({
    this.specialization,
    this.cvTags,
  });

  factory TransitObjectForUpdateCVInfo.fromJson(Map<String, dynamic> json) =>
      _$TransitObjectForUpdateCVInfoFromJson(json);

  @JsonKey(name: 'specialization')
  final Specialization? specialization;
  @JsonKey(name: 'cvTags', defaultValue: <CVTag>[])
  final List<CVTag>? cvTags;
  static const fromJsonFactory = _$TransitObjectForUpdateCVInfoFromJson;
  static const toJsonFactory = _$TransitObjectForUpdateCVInfoToJson;
  Map<String, dynamic> toJson() => _$TransitObjectForUpdateCVInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TransitObjectForUpdateCVInfo &&
            (identical(other.specialization, specialization) ||
                const DeepCollectionEquality()
                    .equals(other.specialization, specialization)) &&
            (identical(other.cvTags, cvTags) ||
                const DeepCollectionEquality().equals(other.cvTags, cvTags)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(specialization) ^
      const DeepCollectionEquality().hash(cvTags) ^
      runtimeType.hashCode;
}

extension $TransitObjectForUpdateCVInfoExtension
    on TransitObjectForUpdateCVInfo {
  TransitObjectForUpdateCVInfo copyWith(
      {Specialization? specialization, List<CVTag>? cvTags}) {
    return TransitObjectForUpdateCVInfo(
        specialization: specialization ?? this.specialization,
        cvTags: cvTags ?? this.cvTags);
  }

  TransitObjectForUpdateCVInfo copyWithWrapped(
      {Wrapped<Specialization?>? specialization,
      Wrapped<List<CVTag>?>? cvTags}) {
    return TransitObjectForUpdateCVInfo(
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        cvTags: (cvTags != null ? cvTags.value : this.cvTags));
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
