// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'c_viewer_service.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexCVAndIFormFile _$ComplexCVAndIFormFileFromJson(
        Map<String, dynamic> json) =>
    ComplexCVAndIFormFile(
      cvDraft: json['cvDraft'] == null
          ? null
          : CVDraftParameter.fromJson(json['cvDraft'] as Map<String, dynamic>),
      file: json['file'] as String?,
    );

Map<String, dynamic> _$ComplexCVAndIFormFileToJson(
    ComplexCVAndIFormFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cvDraft', instance.cvDraft?.toJson());
  writeNotNull('file', instance.file);
  return val;
}

ComplexObjectProfileAndToken _$ComplexObjectProfileAndTokenFromJson(
        Map<String, dynamic> json) =>
    ComplexObjectProfileAndToken(
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComplexObjectProfileAndTokenToJson(
    ComplexObjectProfileAndToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profile', instance.profile?.toJson());
  writeNotNull('token', instance.token?.toJson());
  return val;
}

Cv _$CvFromJson(Map<String, dynamic> json) => Cv(
      id: json['id'] as int,
      statusId: cVStatusTypeFromJson(json['statusId']),
      title: json['title'] as String,
      peopleCreatedId: json['peopleCreatedId'] as int,
      expertIds: (json['expertIds'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      specialization: json['specialization'] == null
          ? null
          : Specialization.fromJson(
              json['specialization'] as Map<String, dynamic>),
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => CVTag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      dateCreation: DateTime.parse(json['dateCreation'] as String),
      goodCv: json['goodCv'] as bool?,
    );

Map<String, dynamic> _$CvToJson(Cv instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('statusId', cVStatusTypeToJson(instance.statusId));
  val['title'] = instance.title;
  val['peopleCreatedId'] = instance.peopleCreatedId;
  writeNotNull('expertIds', instance.expertIds);
  writeNotNull('specialization', instance.specialization?.toJson());
  writeNotNull('description', instance.description);
  writeNotNull('rating', instance.rating);
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  val['dateCreation'] = instance.dateCreation.toIso8601String();
  writeNotNull('goodCv', instance.goodCv);
  return val;
}

CVDraftParameter _$CVDraftParameterFromJson(Map<String, dynamic> json) =>
    CVDraftParameter(
      title: json['title'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [],
      fileName: json['fileName'] as String?,
    );

Map<String, dynamic> _$CVDraftParameterToJson(CVDraftParameter instance) {
  final val = <String, dynamic>{
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags);
  writeNotNull('fileName', instance.fileName);
  return val;
}

CVHistory _$CVHistoryFromJson(Map<String, dynamic> json) => CVHistory(
      id: json['id'] as int,
      cvId: json['cvId'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      expertId: json['expertId'] as int?,
      fileName: json['fileName'] as String?,
      amazonPathToFile: json['amazonPathToFile'] as String?,
      comment: json['comment'] as String?,
      grade: (json['grade'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CVHistoryToJson(CVHistory instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'cvId': instance.cvId,
    'dateTime': instance.dateTime.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expertId', instance.expertId);
  writeNotNull('fileName', instance.fileName);
  writeNotNull('amazonPathToFile', instance.amazonPathToFile);
  writeNotNull('comment', instance.comment);
  writeNotNull('grade', instance.grade);
  return val;
}

CVHistoryParameter _$CVHistoryParameterFromJson(Map<String, dynamic> json) =>
    CVHistoryParameter(
      cvId: json['cvId'] as int,
      expertId: json['expertId'] as int?,
      fileName: json['fileName'] as String?,
      amazonPathToFile: json['amazonPathToFile'] as String?,
      comment: json['comment'] as String?,
      grade: (json['grade'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CVHistoryParameterToJson(CVHistoryParameter instance) {
  final val = <String, dynamic>{
    'cvId': instance.cvId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expertId', instance.expertId);
  writeNotNull('fileName', instance.fileName);
  writeNotNull('amazonPathToFile', instance.amazonPathToFile);
  writeNotNull('comment', instance.comment);
  writeNotNull('grade', instance.grade);
  return val;
}

CVStatusTypeObject _$CVStatusTypeObjectFromJson(Map<String, dynamic> json) =>
    CVStatusTypeObject(
      cvStatusType: cVStatusTypeFromJson(json['cvStatusType']),
    );

Map<String, dynamic> _$CVStatusTypeObjectToJson(CVStatusTypeObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cvStatusType', cVStatusTypeToJson(instance.cvStatusType));
  return val;
}

CVTag _$CVTagFromJson(Map<String, dynamic> json) => CVTag(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CVTagToJson(CVTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String,
      emailAddress: json['emailAddress'] as String,
      biography: json['biography'] as String?,
      isExpert: json['isExpert'] as bool,
      specialization: json['specialization'] == null
          ? null
          : Specialization.fromJson(
              json['specialization'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  val['password'] = instance.password;
  val['emailAddress'] = instance.emailAddress;
  writeNotNull('biography', instance.biography);
  val['isExpert'] = instance.isExpert;
  writeNotNull('specialization', instance.specialization?.toJson());
  writeNotNull('rating', instance.rating);
  return val;
}

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      id: json['id'] as int,
      value: json['value'] as String,
      expirationDateTime: DateTime.parse(json['expirationDateTime'] as String),
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'expirationDateTime': instance.expirationDateTime.toIso8601String(),
    };

TransitObjectSpecializationAndCVTags
    _$TransitObjectSpecializationAndCVTagsFromJson(Map<String, dynamic> json) =>
        TransitObjectSpecializationAndCVTags(
          specialization: json['specialization'] == null
              ? null
              : Specialization.fromJson(
                  json['specialization'] as Map<String, dynamic>),
          cvTags: (json['cvTags'] as List<dynamic>?)
                  ?.map((e) => CVTag.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$TransitObjectSpecializationAndCVTagsToJson(
    TransitObjectSpecializationAndCVTags instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('specialization', instance.specialization?.toJson());
  writeNotNull('cvTags', instance.cvTags?.map((e) => e.toJson()).toList());
  return val;
}

UserCredentials _$UserCredentialsFromJson(Map<String, dynamic> json) =>
    UserCredentials(
      emailAddress: json['emailAddress'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCredentialsToJson(UserCredentials instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'password': instance.password,
    };

PinFileToDraftPost$RequestBody _$PinFileToDraftPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    PinFileToDraftPost$RequestBody(
      fileData: json['fileData'] as String?,
    );

Map<String, dynamic> _$PinFileToDraftPost$RequestBodyToJson(
    PinFileToDraftPost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fileData', instance.fileData);
  return val;
}
