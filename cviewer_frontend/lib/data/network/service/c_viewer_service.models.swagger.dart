// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'c_viewer_service.enums.swagger.dart' as enums;

part 'c_viewer_service.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ComplexObjectProfileAndToken {
  ComplexObjectProfileAndToken({
    this.profile,
    this.token,
  });

  factory ComplexObjectProfileAndToken.fromJson(Map<String, dynamic> json) =>
      _$ComplexObjectProfileAndTokenFromJson(json);

  @JsonKey(name: 'profile')
  final Profile? profile;
  @JsonKey(name: 'token')
  final Token? token;
  static const fromJsonFactory = _$ComplexObjectProfileAndTokenFromJson;
  static const toJsonFactory = _$ComplexObjectProfileAndTokenToJson;
  Map<String, dynamic> toJson() => _$ComplexObjectProfileAndTokenToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ComplexObjectProfileAndToken &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality()
                    .equals(other.profile, profile)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(profile) ^
      const DeepCollectionEquality().hash(token) ^
      runtimeType.hashCode;
}

extension $ComplexObjectProfileAndTokenExtension
    on ComplexObjectProfileAndToken {
  ComplexObjectProfileAndToken copyWith({Profile? profile, Token? token}) {
    return ComplexObjectProfileAndToken(
        profile: profile ?? this.profile, token: token ?? this.token);
  }

  ComplexObjectProfileAndToken copyWithWrapped(
      {Wrapped<Profile?>? profile, Wrapped<Token?>? token}) {
    return ComplexObjectProfileAndToken(
        profile: (profile != null ? profile.value : this.profile),
        token: (token != null ? token.value : this.token));
  }
}

@JsonSerializable(explicitToJson: true)
class Cv {
  Cv({
    required this.id,
    required this.statusId,
    required this.title,
    required this.peopleCreatedId,
    this.expertIds,
    this.specialization,
    this.description,
    this.rating,
    this.tags,
    required this.dateCreation,
    this.goodCv,
  });

  factory Cv.fromJson(Map<String, dynamic> json) => _$CvFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(
    name: 'statusId',
    toJson: cVStatusTypeToJson,
    fromJson: cVStatusTypeFromJson,
  )
  final enums.CVStatusType statusId;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'peopleCreatedId')
  final int peopleCreatedId;
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
  final DateTime dateCreation;
  @JsonKey(name: 'goodCv')
  final bool? goodCv;
  static const fromJsonFactory = _$CvFromJson;
  static const toJsonFactory = _$CvToJson;
  Map<String, dynamic> toJson() => _$CvToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Cv &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.statusId, statusId) ||
                const DeepCollectionEquality()
                    .equals(other.statusId, statusId)) &&
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
                    .equals(other.dateCreation, dateCreation)) &&
            (identical(other.goodCv, goodCv) ||
                const DeepCollectionEquality().equals(other.goodCv, goodCv)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(statusId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(peopleCreatedId) ^
      const DeepCollectionEquality().hash(expertIds) ^
      const DeepCollectionEquality().hash(specialization) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(dateCreation) ^
      const DeepCollectionEquality().hash(goodCv) ^
      runtimeType.hashCode;
}

extension $CvExtension on Cv {
  Cv copyWith(
      {int? id,
      enums.CVStatusType? statusId,
      String? title,
      int? peopleCreatedId,
      List<int>? expertIds,
      Specialization? specialization,
      String? description,
      double? rating,
      List<CVTag>? tags,
      DateTime? dateCreation,
      bool? goodCv}) {
    return Cv(
        id: id ?? this.id,
        statusId: statusId ?? this.statusId,
        title: title ?? this.title,
        peopleCreatedId: peopleCreatedId ?? this.peopleCreatedId,
        expertIds: expertIds ?? this.expertIds,
        specialization: specialization ?? this.specialization,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        tags: tags ?? this.tags,
        dateCreation: dateCreation ?? this.dateCreation,
        goodCv: goodCv ?? this.goodCv);
  }

  Cv copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<enums.CVStatusType>? statusId,
      Wrapped<String>? title,
      Wrapped<int>? peopleCreatedId,
      Wrapped<List<int>?>? expertIds,
      Wrapped<Specialization?>? specialization,
      Wrapped<String?>? description,
      Wrapped<double?>? rating,
      Wrapped<List<CVTag>?>? tags,
      Wrapped<DateTime>? dateCreation,
      Wrapped<bool?>? goodCv}) {
    return Cv(
        id: (id != null ? id.value : this.id),
        statusId: (statusId != null ? statusId.value : this.statusId),
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
            (dateCreation != null ? dateCreation.value : this.dateCreation),
        goodCv: (goodCv != null ? goodCv.value : this.goodCv));
  }
}

@JsonSerializable(explicitToJson: true)
class CVHistory {
  CVHistory({
    required this.id,
    required this.cvId,
    required this.dateTime,
    this.expertId,
    this.fileName,
    this.amazonPathToFile,
    this.comment,
    this.grade,
  });

  factory CVHistory.fromJson(Map<String, dynamic> json) =>
      _$CVHistoryFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'cvId')
  final int cvId;
  @JsonKey(name: 'dateTime')
  final DateTime dateTime;
  @JsonKey(name: 'expertId')
  final int? expertId;
  @JsonKey(name: 'fileName')
  final String? fileName;
  @JsonKey(name: 'amazonPathToFile')
  final String? amazonPathToFile;
  @JsonKey(name: 'comment')
  final String? comment;
  @JsonKey(name: 'grade')
  final double? grade;
  static const fromJsonFactory = _$CVHistoryFromJson;
  static const toJsonFactory = _$CVHistoryToJson;
  Map<String, dynamic> toJson() => _$CVHistoryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CVHistory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.cvId, cvId) ||
                const DeepCollectionEquality().equals(other.cvId, cvId)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.expertId, expertId) ||
                const DeepCollectionEquality()
                    .equals(other.expertId, expertId)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.amazonPathToFile, amazonPathToFile) ||
                const DeepCollectionEquality()
                    .equals(other.amazonPathToFile, amazonPathToFile)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(cvId) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(expertId) ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(amazonPathToFile) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(grade) ^
      runtimeType.hashCode;
}

extension $CVHistoryExtension on CVHistory {
  CVHistory copyWith(
      {int? id,
      int? cvId,
      DateTime? dateTime,
      int? expertId,
      String? fileName,
      String? amazonPathToFile,
      String? comment,
      double? grade}) {
    return CVHistory(
        id: id ?? this.id,
        cvId: cvId ?? this.cvId,
        dateTime: dateTime ?? this.dateTime,
        expertId: expertId ?? this.expertId,
        fileName: fileName ?? this.fileName,
        amazonPathToFile: amazonPathToFile ?? this.amazonPathToFile,
        comment: comment ?? this.comment,
        grade: grade ?? this.grade);
  }

  CVHistory copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<int>? cvId,
      Wrapped<DateTime>? dateTime,
      Wrapped<int?>? expertId,
      Wrapped<String?>? fileName,
      Wrapped<String?>? amazonPathToFile,
      Wrapped<String?>? comment,
      Wrapped<double?>? grade}) {
    return CVHistory(
        id: (id != null ? id.value : this.id),
        cvId: (cvId != null ? cvId.value : this.cvId),
        dateTime: (dateTime != null ? dateTime.value : this.dateTime),
        expertId: (expertId != null ? expertId.value : this.expertId),
        fileName: (fileName != null ? fileName.value : this.fileName),
        amazonPathToFile: (amazonPathToFile != null
            ? amazonPathToFile.value
            : this.amazonPathToFile),
        comment: (comment != null ? comment.value : this.comment),
        grade: (grade != null ? grade.value : this.grade));
  }
}

@JsonSerializable(explicitToJson: true)
class CVHistoryParameter {
  CVHistoryParameter({
    required this.cvId,
    this.expertId,
    this.fileName,
    this.amazonPathToFile,
    this.comment,
    this.grade,
  });

  factory CVHistoryParameter.fromJson(Map<String, dynamic> json) =>
      _$CVHistoryParameterFromJson(json);

  @JsonKey(name: 'cvId')
  final int cvId;
  @JsonKey(name: 'expertId')
  final int? expertId;
  @JsonKey(name: 'fileName')
  final String? fileName;
  @JsonKey(name: 'amazonPathToFile')
  final String? amazonPathToFile;
  @JsonKey(name: 'comment')
  final String? comment;
  @JsonKey(name: 'grade')
  final double? grade;
  static const fromJsonFactory = _$CVHistoryParameterFromJson;
  static const toJsonFactory = _$CVHistoryParameterToJson;
  Map<String, dynamic> toJson() => _$CVHistoryParameterToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CVHistoryParameter &&
            (identical(other.cvId, cvId) ||
                const DeepCollectionEquality().equals(other.cvId, cvId)) &&
            (identical(other.expertId, expertId) ||
                const DeepCollectionEquality()
                    .equals(other.expertId, expertId)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.amazonPathToFile, amazonPathToFile) ||
                const DeepCollectionEquality()
                    .equals(other.amazonPathToFile, amazonPathToFile)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cvId) ^
      const DeepCollectionEquality().hash(expertId) ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(amazonPathToFile) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(grade) ^
      runtimeType.hashCode;
}

extension $CVHistoryParameterExtension on CVHistoryParameter {
  CVHistoryParameter copyWith(
      {int? cvId,
      int? expertId,
      String? fileName,
      String? amazonPathToFile,
      String? comment,
      double? grade}) {
    return CVHistoryParameter(
        cvId: cvId ?? this.cvId,
        expertId: expertId ?? this.expertId,
        fileName: fileName ?? this.fileName,
        amazonPathToFile: amazonPathToFile ?? this.amazonPathToFile,
        comment: comment ?? this.comment,
        grade: grade ?? this.grade);
  }

  CVHistoryParameter copyWithWrapped(
      {Wrapped<int>? cvId,
      Wrapped<int?>? expertId,
      Wrapped<String?>? fileName,
      Wrapped<String?>? amazonPathToFile,
      Wrapped<String?>? comment,
      Wrapped<double?>? grade}) {
    return CVHistoryParameter(
        cvId: (cvId != null ? cvId.value : this.cvId),
        expertId: (expertId != null ? expertId.value : this.expertId),
        fileName: (fileName != null ? fileName.value : this.fileName),
        amazonPathToFile: (amazonPathToFile != null
            ? amazonPathToFile.value
            : this.amazonPathToFile),
        comment: (comment != null ? comment.value : this.comment),
        grade: (grade != null ? grade.value : this.grade));
  }
}

@JsonSerializable(explicitToJson: true)
class CVStatusTypeObject {
  CVStatusTypeObject({
    this.cvStatusType,
  });

  factory CVStatusTypeObject.fromJson(Map<String, dynamic> json) =>
      _$CVStatusTypeObjectFromJson(json);

  @JsonKey(
    name: 'cvStatusType',
    toJson: cVStatusTypeToJson,
    fromJson: cVStatusTypeFromJson,
  )
  final enums.CVStatusType? cvStatusType;
  static const fromJsonFactory = _$CVStatusTypeObjectFromJson;
  static const toJsonFactory = _$CVStatusTypeObjectToJson;
  Map<String, dynamic> toJson() => _$CVStatusTypeObjectToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CVStatusTypeObject &&
            (identical(other.cvStatusType, cvStatusType) ||
                const DeepCollectionEquality()
                    .equals(other.cvStatusType, cvStatusType)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cvStatusType) ^ runtimeType.hashCode;
}

extension $CVStatusTypeObjectExtension on CVStatusTypeObject {
  CVStatusTypeObject copyWith({enums.CVStatusType? cvStatusType}) {
    return CVStatusTypeObject(cvStatusType: cvStatusType ?? this.cvStatusType);
  }

  CVStatusTypeObject copyWithWrapped(
      {Wrapped<enums.CVStatusType?>? cvStatusType}) {
    return CVStatusTypeObject(
        cvStatusType:
            (cvStatusType != null ? cvStatusType.value : this.cvStatusType));
  }
}

@JsonSerializable(explicitToJson: true)
class CVTag {
  CVTag({
    required this.id,
    required this.name,
  });

  factory CVTag.fromJson(Map<String, dynamic> json) => _$CVTagFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
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

  CVTag copyWithWrapped({Wrapped<int>? id, Wrapped<String>? name}) {
    return CVTag(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class Profile {
  Profile({
    required this.id,
    this.firstName,
    this.lastName,
    required this.password,
    required this.emailAddress,
    this.biography,
    required this.isExpert,
    this.specialization,
    this.rating,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'emailAddress')
  final String emailAddress;
  @JsonKey(name: 'biography')
  final String? biography;
  @JsonKey(name: 'isExpert')
  final bool isExpert;
  @JsonKey(name: 'specialization')
  final Specialization? specialization;
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
            (identical(other.specialization, specialization) ||
                const DeepCollectionEquality()
                    .equals(other.specialization, specialization)) &&
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
      const DeepCollectionEquality().hash(specialization) ^
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
      Specialization? specialization,
      double? rating}) {
    return Profile(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        emailAddress: emailAddress ?? this.emailAddress,
        biography: biography ?? this.biography,
        isExpert: isExpert ?? this.isExpert,
        specialization: specialization ?? this.specialization,
        rating: rating ?? this.rating);
  }

  Profile copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String>? password,
      Wrapped<String>? emailAddress,
      Wrapped<String?>? biography,
      Wrapped<bool>? isExpert,
      Wrapped<Specialization?>? specialization,
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
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        rating: (rating != null ? rating.value : this.rating));
  }
}

@JsonSerializable(explicitToJson: true)
class Specialization {
  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
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

  Specialization copyWithWrapped({Wrapped<int>? id, Wrapped<String>? name}) {
    return Specialization(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class Token {
  Token({
    required this.id,
    required this.value,
    required this.expirationDateTime,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'value')
  final String value;
  @JsonKey(name: 'expirationDateTime')
  final DateTime expirationDateTime;
  static const fromJsonFactory = _$TokenFromJson;
  static const toJsonFactory = _$TokenToJson;
  Map<String, dynamic> toJson() => _$TokenToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Token &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.expirationDateTime, expirationDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.expirationDateTime, expirationDateTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(expirationDateTime) ^
      runtimeType.hashCode;
}

extension $TokenExtension on Token {
  Token copyWith({int? id, String? value, DateTime? expirationDateTime}) {
    return Token(
        id: id ?? this.id,
        value: value ?? this.value,
        expirationDateTime: expirationDateTime ?? this.expirationDateTime);
  }

  Token copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? value,
      Wrapped<DateTime>? expirationDateTime}) {
    return Token(
        id: (id != null ? id.value : this.id),
        value: (value != null ? value.value : this.value),
        expirationDateTime: (expirationDateTime != null
            ? expirationDateTime.value
            : this.expirationDateTime));
  }
}

@JsonSerializable(explicitToJson: true)
class TransitObjectSpecializationAndCVTags {
  TransitObjectSpecializationAndCVTags({
    this.specialization,
    this.cvTags,
  });

  factory TransitObjectSpecializationAndCVTags.fromJson(
          Map<String, dynamic> json) =>
      _$TransitObjectSpecializationAndCVTagsFromJson(json);

  @JsonKey(name: 'specialization')
  final Specialization? specialization;
  @JsonKey(name: 'cvTags', defaultValue: <CVTag>[])
  final List<CVTag>? cvTags;
  static const fromJsonFactory = _$TransitObjectSpecializationAndCVTagsFromJson;
  static const toJsonFactory = _$TransitObjectSpecializationAndCVTagsToJson;
  Map<String, dynamic> toJson() =>
      _$TransitObjectSpecializationAndCVTagsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TransitObjectSpecializationAndCVTags &&
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

extension $TransitObjectSpecializationAndCVTagsExtension
    on TransitObjectSpecializationAndCVTags {
  TransitObjectSpecializationAndCVTags copyWith(
      {Specialization? specialization, List<CVTag>? cvTags}) {
    return TransitObjectSpecializationAndCVTags(
        specialization: specialization ?? this.specialization,
        cvTags: cvTags ?? this.cvTags);
  }

  TransitObjectSpecializationAndCVTags copyWithWrapped(
      {Wrapped<Specialization?>? specialization,
      Wrapped<List<CVTag>?>? cvTags}) {
    return TransitObjectSpecializationAndCVTags(
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        cvTags: (cvTags != null ? cvTags.value : this.cvTags));
  }
}

@JsonSerializable(explicitToJson: true)
class UserCredentials {
  UserCredentials({
    required this.emailAddress,
    required this.password,
  });

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsFromJson(json);

  @JsonKey(name: 'emailAddress')
  final String emailAddress;
  @JsonKey(name: 'password')
  final String password;
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
      {Wrapped<String>? emailAddress, Wrapped<String>? password}) {
    return UserCredentials(
        emailAddress:
            (emailAddress != null ? emailAddress.value : this.emailAddress),
        password: (password != null ? password.value : this.password));
  }
}

String? cVStatusTypeToJson(enums.CVStatusType? cVStatusType) {
  return enums.$CVStatusTypeMap[cVStatusType];
}

enums.CVStatusType cVStatusTypeFromJson(
  Object? cVStatusType, [
  enums.CVStatusType? defaultValue,
]) {
  if (cVStatusType is String) {
    return enums.$CVStatusTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == cVStatusType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.CVStatusType.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$CVStatusTypeMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.CVStatusType.swaggerGeneratedUnknown;
}

List<String> cVStatusTypeListToJson(List<enums.CVStatusType>? cVStatusType) {
  if (cVStatusType == null) {
    return [];
  }

  return cVStatusType.map((e) => enums.$CVStatusTypeMap[e]!).toList();
}

List<enums.CVStatusType> cVStatusTypeListFromJson(
  List? cVStatusType, [
  List<enums.CVStatusType>? defaultValue,
]) {
  if (cVStatusType == null) {
    return defaultValue ?? [];
  }

  return cVStatusType.map((e) => cVStatusTypeFromJson(e.toString())).toList();
}

List<enums.CVStatusType>? cVStatusTypeNullableListFromJson(
  List? cVStatusType, [
  List<enums.CVStatusType>? defaultValue,
]) {
  if (cVStatusType == null) {
    return defaultValue;
  }

  return cVStatusType.map((e) => cVStatusTypeFromJson(e.toString())).toList();
}

@JsonSerializable(explicitToJson: true)
class PinFileToDraftPost$RequestBody {
  PinFileToDraftPost$RequestBody({
    this.fileData,
  });

  factory PinFileToDraftPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$PinFileToDraftPost$RequestBodyFromJson(json);

  @JsonKey(name: 'fileData')
  final String? fileData;
  static const fromJsonFactory = _$PinFileToDraftPost$RequestBodyFromJson;
  static const toJsonFactory = _$PinFileToDraftPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$PinFileToDraftPost$RequestBodyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PinFileToDraftPost$RequestBody &&
            (identical(other.fileData, fileData) ||
                const DeepCollectionEquality()
                    .equals(other.fileData, fileData)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fileData) ^ runtimeType.hashCode;
}

extension $PinFileToDraftPost$RequestBodyExtension
    on PinFileToDraftPost$RequestBody {
  PinFileToDraftPost$RequestBody copyWith({String? fileData}) {
    return PinFileToDraftPost$RequestBody(fileData: fileData ?? this.fileData);
  }

  PinFileToDraftPost$RequestBody copyWithWrapped({Wrapped<String?>? fileData}) {
    return PinFileToDraftPost$RequestBody(
        fileData: (fileData != null ? fileData.value : this.fileData));
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
