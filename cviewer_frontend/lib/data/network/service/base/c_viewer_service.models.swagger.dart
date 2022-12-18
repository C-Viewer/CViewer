// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'c_viewer_service.enums.swagger.dart' as enums;

part 'c_viewer_service.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ComplexCVAndIFormFile {
  ComplexCVAndIFormFile({
    this.cvDraft,
    this.file,
  });

  factory ComplexCVAndIFormFile.fromJson(Map<String, dynamic> json) =>
      _$ComplexCVAndIFormFileFromJson(json);

  @JsonKey(name: 'cvDraft')
  final CVDraftParameter? cvDraft;
  @JsonKey(name: 'file')
  final String? file;
  static const fromJsonFactory = _$ComplexCVAndIFormFileFromJson;
  static const toJsonFactory = _$ComplexCVAndIFormFileToJson;
  Map<String, dynamic> toJson() => _$ComplexCVAndIFormFileToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ComplexCVAndIFormFile &&
            (identical(other.cvDraft, cvDraft) ||
                const DeepCollectionEquality()
                    .equals(other.cvDraft, cvDraft)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cvDraft) ^
      const DeepCollectionEquality().hash(file) ^
      runtimeType.hashCode;
}

extension $ComplexCVAndIFormFileExtension on ComplexCVAndIFormFile {
  ComplexCVAndIFormFile copyWith({CVDraftParameter? cvDraft, String? file}) {
    return ComplexCVAndIFormFile(
        cvDraft: cvDraft ?? this.cvDraft, file: file ?? this.file);
  }

  ComplexCVAndIFormFile copyWithWrapped(
      {Wrapped<CVDraftParameter?>? cvDraft, Wrapped<String?>? file}) {
    return ComplexCVAndIFormFile(
        cvDraft: (cvDraft != null ? cvDraft.value : this.cvDraft),
        file: (file != null ? file.value : this.file));
  }
}

@JsonSerializable(explicitToJson: true)
class ComplexCVHistoryParameterAndFIle {
  ComplexCVHistoryParameterAndFIle({
    this.cvHistoryParameter,
    this.file,
  });

  factory ComplexCVHistoryParameterAndFIle.fromJson(
          Map<String, dynamic> json) =>
      _$ComplexCVHistoryParameterAndFIleFromJson(json);

  @JsonKey(name: 'cvHistoryParameter')
  final CVHistoryParameter? cvHistoryParameter;
  @JsonKey(name: 'file')
  final String? file;
  static const fromJsonFactory = _$ComplexCVHistoryParameterAndFIleFromJson;
  static const toJsonFactory = _$ComplexCVHistoryParameterAndFIleToJson;
  Map<String, dynamic> toJson() =>
      _$ComplexCVHistoryParameterAndFIleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ComplexCVHistoryParameterAndFIle &&
            (identical(other.cvHistoryParameter, cvHistoryParameter) ||
                const DeepCollectionEquality()
                    .equals(other.cvHistoryParameter, cvHistoryParameter)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cvHistoryParameter) ^
      const DeepCollectionEquality().hash(file) ^
      runtimeType.hashCode;
}

extension $ComplexCVHistoryParameterAndFIleExtension
    on ComplexCVHistoryParameterAndFIle {
  ComplexCVHistoryParameterAndFIle copyWith(
      {CVHistoryParameter? cvHistoryParameter, String? file}) {
    return ComplexCVHistoryParameterAndFIle(
        cvHistoryParameter: cvHistoryParameter ?? this.cvHistoryParameter,
        file: file ?? this.file);
  }

  ComplexCVHistoryParameterAndFIle copyWithWrapped(
      {Wrapped<CVHistoryParameter?>? cvHistoryParameter,
      Wrapped<String?>? file}) {
    return ComplexCVHistoryParameterAndFIle(
        cvHistoryParameter: (cvHistoryParameter != null
            ? cvHistoryParameter.value
            : this.cvHistoryParameter),
        file: (file != null ? file.value : this.file));
  }
}

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
    this.tags,
    required this.dateCreation,
    this.goodCv,
    this.openToReview,
    this.urlFileForDownload,
    this.pinnedFileName,
    this.grade,
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
  @JsonKey(name: 'tags', defaultValue: <CVTag>[])
  final List<CVTag>? tags;
  @JsonKey(name: 'dateCreation')
  final DateTime dateCreation;
  @JsonKey(name: 'goodCv')
  final bool? goodCv;
  @JsonKey(name: 'openToReview')
  final bool? openToReview;
  @JsonKey(name: 'urlFileForDownload')
  final String? urlFileForDownload;
  @JsonKey(name: 'pinnedFileName')
  final String? pinnedFileName;
  @JsonKey(name: 'grade')
  final int? grade;
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
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.dateCreation, dateCreation) ||
                const DeepCollectionEquality()
                    .equals(other.dateCreation, dateCreation)) &&
            (identical(other.goodCv, goodCv) ||
                const DeepCollectionEquality().equals(other.goodCv, goodCv)) &&
            (identical(other.openToReview, openToReview) ||
                const DeepCollectionEquality()
                    .equals(other.openToReview, openToReview)) &&
            (identical(other.urlFileForDownload, urlFileForDownload) ||
                const DeepCollectionEquality()
                    .equals(other.urlFileForDownload, urlFileForDownload)) &&
            (identical(other.pinnedFileName, pinnedFileName) ||
                const DeepCollectionEquality()
                    .equals(other.pinnedFileName, pinnedFileName)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)));
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
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(dateCreation) ^
      const DeepCollectionEquality().hash(goodCv) ^
      const DeepCollectionEquality().hash(openToReview) ^
      const DeepCollectionEquality().hash(urlFileForDownload) ^
      const DeepCollectionEquality().hash(pinnedFileName) ^
      const DeepCollectionEquality().hash(grade) ^
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
      List<CVTag>? tags,
      DateTime? dateCreation,
      bool? goodCv,
      bool? openToReview,
      String? urlFileForDownload,
      String? pinnedFileName,
      int? grade}) {
    return Cv(
        id: id ?? this.id,
        statusId: statusId ?? this.statusId,
        title: title ?? this.title,
        peopleCreatedId: peopleCreatedId ?? this.peopleCreatedId,
        expertIds: expertIds ?? this.expertIds,
        specialization: specialization ?? this.specialization,
        description: description ?? this.description,
        tags: tags ?? this.tags,
        dateCreation: dateCreation ?? this.dateCreation,
        goodCv: goodCv ?? this.goodCv,
        openToReview: openToReview ?? this.openToReview,
        urlFileForDownload: urlFileForDownload ?? this.urlFileForDownload,
        pinnedFileName: pinnedFileName ?? this.pinnedFileName,
        grade: grade ?? this.grade);
  }

  Cv copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<enums.CVStatusType>? statusId,
      Wrapped<String>? title,
      Wrapped<int>? peopleCreatedId,
      Wrapped<List<int>?>? expertIds,
      Wrapped<Specialization?>? specialization,
      Wrapped<String?>? description,
      Wrapped<List<CVTag>?>? tags,
      Wrapped<DateTime>? dateCreation,
      Wrapped<bool?>? goodCv,
      Wrapped<bool?>? openToReview,
      Wrapped<String?>? urlFileForDownload,
      Wrapped<String?>? pinnedFileName,
      Wrapped<int?>? grade}) {
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
        tags: (tags != null ? tags.value : this.tags),
        dateCreation:
            (dateCreation != null ? dateCreation.value : this.dateCreation),
        goodCv: (goodCv != null ? goodCv.value : this.goodCv),
        openToReview:
            (openToReview != null ? openToReview.value : this.openToReview),
        urlFileForDownload: (urlFileForDownload != null
            ? urlFileForDownload.value
            : this.urlFileForDownload),
        pinnedFileName: (pinnedFileName != null
            ? pinnedFileName.value
            : this.pinnedFileName),
        grade: (grade != null ? grade.value : this.grade));
  }
}

@JsonSerializable(explicitToJson: true)
class CVDraftParameter {
  CVDraftParameter({
    required this.title,
    this.tags,
    this.fileName,
  });

  factory CVDraftParameter.fromJson(Map<String, dynamic> json) =>
      _$CVDraftParameterFromJson(json);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'tags', defaultValue: <int>[])
  final List<int>? tags;
  @JsonKey(name: 'fileName')
  final String? fileName;
  static const fromJsonFactory = _$CVDraftParameterFromJson;
  static const toJsonFactory = _$CVDraftParameterToJson;
  Map<String, dynamic> toJson() => _$CVDraftParameterToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CVDraftParameter &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(fileName) ^
      runtimeType.hashCode;
}

extension $CVDraftParameterExtension on CVDraftParameter {
  CVDraftParameter copyWith(
      {String? title, List<int>? tags, String? fileName}) {
    return CVDraftParameter(
        title: title ?? this.title,
        tags: tags ?? this.tags,
        fileName: fileName ?? this.fileName);
  }

  CVDraftParameter copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<List<int>?>? tags,
      Wrapped<String?>? fileName}) {
    return CVDraftParameter(
        title: (title != null ? title.value : this.title),
        tags: (tags != null ? tags.value : this.tags),
        fileName: (fileName != null ? fileName.value : this.fileName));
  }
}

@JsonSerializable(explicitToJson: true)
class CVHistory {
  CVHistory({
    required this.id,
    required this.cvId,
    required this.dateTime,
    this.authorId,
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
  @JsonKey(name: 'authorId')
  final int? authorId;
  @JsonKey(name: 'fileName')
  final String? fileName;
  @JsonKey(name: 'amazonPathToFile')
  final String? amazonPathToFile;
  @JsonKey(name: 'comment')
  final String? comment;
  @JsonKey(name: 'grade')
  final int? grade;
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
            (identical(other.authorId, authorId) ||
                const DeepCollectionEquality()
                    .equals(other.authorId, authorId)) &&
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
      const DeepCollectionEquality().hash(authorId) ^
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
      int? authorId,
      String? fileName,
      String? amazonPathToFile,
      String? comment,
      int? grade}) {
    return CVHistory(
        id: id ?? this.id,
        cvId: cvId ?? this.cvId,
        dateTime: dateTime ?? this.dateTime,
        authorId: authorId ?? this.authorId,
        fileName: fileName ?? this.fileName,
        amazonPathToFile: amazonPathToFile ?? this.amazonPathToFile,
        comment: comment ?? this.comment,
        grade: grade ?? this.grade);
  }

  CVHistory copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<int>? cvId,
      Wrapped<DateTime>? dateTime,
      Wrapped<int?>? authorId,
      Wrapped<String?>? fileName,
      Wrapped<String?>? amazonPathToFile,
      Wrapped<String?>? comment,
      Wrapped<int?>? grade}) {
    return CVHistory(
        id: (id != null ? id.value : this.id),
        cvId: (cvId != null ? cvId.value : this.cvId),
        dateTime: (dateTime != null ? dateTime.value : this.dateTime),
        authorId: (authorId != null ? authorId.value : this.authorId),
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
    required this.authorId,
    this.fileName,
    this.comment,
    this.grade,
  });

  factory CVHistoryParameter.fromJson(Map<String, dynamic> json) =>
      _$CVHistoryParameterFromJson(json);

  @JsonKey(name: 'cvId')
  final int cvId;
  @JsonKey(name: 'authorId')
  final int authorId;
  @JsonKey(name: 'fileName')
  final String? fileName;
  @JsonKey(name: 'comment')
  final String? comment;
  @JsonKey(name: 'grade')
  final int? grade;
  static const fromJsonFactory = _$CVHistoryParameterFromJson;
  static const toJsonFactory = _$CVHistoryParameterToJson;
  Map<String, dynamic> toJson() => _$CVHistoryParameterToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CVHistoryParameter &&
            (identical(other.cvId, cvId) ||
                const DeepCollectionEquality().equals(other.cvId, cvId)) &&
            (identical(other.authorId, authorId) ||
                const DeepCollectionEquality()
                    .equals(other.authorId, authorId)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
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
      const DeepCollectionEquality().hash(authorId) ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(grade) ^
      runtimeType.hashCode;
}

extension $CVHistoryParameterExtension on CVHistoryParameter {
  CVHistoryParameter copyWith(
      {int? cvId,
      int? authorId,
      String? fileName,
      String? comment,
      int? grade}) {
    return CVHistoryParameter(
        cvId: cvId ?? this.cvId,
        authorId: authorId ?? this.authorId,
        fileName: fileName ?? this.fileName,
        comment: comment ?? this.comment,
        grade: grade ?? this.grade);
  }

  CVHistoryParameter copyWithWrapped(
      {Wrapped<int>? cvId,
      Wrapped<int>? authorId,
      Wrapped<String?>? fileName,
      Wrapped<String?>? comment,
      Wrapped<int?>? grade}) {
    return CVHistoryParameter(
        cvId: (cvId != null ? cvId.value : this.cvId),
        authorId: (authorId != null ? authorId.value : this.authorId),
        fileName: (fileName != null ? fileName.value : this.fileName),
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
    this.dateRegistration,
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
  @JsonKey(name: 'dateRegistration')
  final DateTime? dateRegistration;
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
            (identical(other.dateRegistration, dateRegistration) ||
                const DeepCollectionEquality()
                    .equals(other.dateRegistration, dateRegistration)) &&
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
      const DeepCollectionEquality().hash(dateRegistration) ^
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
      DateTime? dateRegistration,
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
        dateRegistration: dateRegistration ?? this.dateRegistration,
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
      Wrapped<DateTime?>? dateRegistration,
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
        dateRegistration: (dateRegistration != null
            ? dateRegistration.value
            : this.dateRegistration),
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

@JsonSerializable(explicitToJson: true)
class StoreFilePut$RequestBody {
  StoreFilePut$RequestBody({
    this.stream,
  });

  factory StoreFilePut$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$StoreFilePut$RequestBodyFromJson(json);

  @JsonKey(name: 'stream')
  final String? stream;
  static const fromJsonFactory = _$StoreFilePut$RequestBodyFromJson;
  static const toJsonFactory = _$StoreFilePut$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$StoreFilePut$RequestBodyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StoreFilePut$RequestBody &&
            (identical(other.stream, stream) ||
                const DeepCollectionEquality().equals(other.stream, stream)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(stream) ^ runtimeType.hashCode;
}

extension $StoreFilePut$RequestBodyExtension on StoreFilePut$RequestBody {
  StoreFilePut$RequestBody copyWith({String? stream}) {
    return StoreFilePut$RequestBody(stream: stream ?? this.stream);
  }

  StoreFilePut$RequestBody copyWithWrapped({Wrapped<String?>? stream}) {
    return StoreFilePut$RequestBody(
        stream: (stream != null ? stream.value : this.stream));
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
