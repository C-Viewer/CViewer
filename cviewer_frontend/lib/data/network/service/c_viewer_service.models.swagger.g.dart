// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'c_viewer_service.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachedFile _$AttachedFileFromJson(Map<String, dynamic> json) => AttachedFile(
      id: json['id'] as int?,
      fileName: json['fileName'] as String?,
      filePath: json['filePath'] as String?,
    );

Map<String, dynamic> _$AttachedFileToJson(AttachedFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('fileName', instance.fileName);
  writeNotNull('filePath', instance.filePath);
  return val;
}

Cv _$CvFromJson(Map<String, dynamic> json) => Cv(
      id: json['id'] as int?,
      title: json['title'] as String?,
      peopleCreatedId: json['peopleCreatedId'] as int?,
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
      dateCreation: json['dateCreation'] == null
          ? null
          : DateTime.parse(json['dateCreation'] as String),
    );

Map<String, dynamic> _$CvToJson(Cv instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('peopleCreatedId', instance.peopleCreatedId);
  writeNotNull('expertIds', instance.expertIds);
  writeNotNull('specialization', instance.specialization?.toJson());
  writeNotNull('description', instance.description);
  writeNotNull('rating', instance.rating);
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  writeNotNull('dateCreation', instance.dateCreation?.toIso8601String());
  return val;
}

CVHistory _$CVHistoryFromJson(Map<String, dynamic> json) => CVHistory(
      id: json['id'] as int?,
      attachedFileId: json['attachedFileId'] as int?,
      cvId: json['cvId'] as int?,
      expertId: json['expertId'] as int?,
      amazonPathToFile: json['amazonPathToFile'] as String?,
      comment: json['comment'] as String?,
      grade: (json['grade'] as num?)?.toDouble(),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$CVHistoryToJson(CVHistory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('attachedFileId', instance.attachedFileId);
  writeNotNull('cvId', instance.cvId);
  writeNotNull('expertId', instance.expertId);
  writeNotNull('amazonPathToFile', instance.amazonPathToFile);
  writeNotNull('comment', instance.comment);
  writeNotNull('grade', instance.grade);
  writeNotNull('dateTime', instance.dateTime?.toIso8601String());
  return val;
}

CVTag _$CVTagFromJson(Map<String, dynamic> json) => CVTag(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CVTagToJson(CVTag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String?,
      emailAddress: json['emailAddress'] as String?,
      biography: json['biography'] as String?,
      isExpert: json['isExpert'] as bool?,
      specializationId: json['specializationId'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('password', instance.password);
  writeNotNull('emailAddress', instance.emailAddress);
  writeNotNull('biography', instance.biography);
  writeNotNull('isExpert', instance.isExpert);
  writeNotNull('specializationId', instance.specializationId);
  writeNotNull('rating', instance.rating);
  return val;
}

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

TransitObjectForUpdateCVInfo _$TransitObjectForUpdateCVInfoFromJson(
        Map<String, dynamic> json) =>
    TransitObjectForUpdateCVInfo(
      specialization: json['specialization'] == null
          ? null
          : Specialization.fromJson(
              json['specialization'] as Map<String, dynamic>),
      cvTags: (json['cvTags'] as List<dynamic>?)
              ?.map((e) => CVTag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TransitObjectForUpdateCVInfoToJson(
    TransitObjectForUpdateCVInfo instance) {
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
      emailAddress: json['emailAddress'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserCredentialsToJson(UserCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emailAddress', instance.emailAddress);
  writeNotNull('password', instance.password);
  return val;
}
