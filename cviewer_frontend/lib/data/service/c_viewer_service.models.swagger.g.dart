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
      specialization: specializationFromJson(json['specialization']),
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      tags: cVTagListFromJson(json['tags'] as List?),
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
  writeNotNull('specialization', specializationToJson(instance.specialization));
  writeNotNull('description', instance.description);
  writeNotNull('rating', instance.rating);
  val['tags'] = cVTagListToJson(instance.tags);
  writeNotNull('dateCreation', instance.dateCreation?.toIso8601String());
  return val;
}

CVHistory _$CVHistoryFromJson(Map<String, dynamic> json) => CVHistory(
      id: json['id'] as int?,
      attachedFileId: json['attachedFileId'] as int?,
      cvId: json['cvId'] as int?,
      amazonPathToFile: json['amazonPathToFile'] as String?,
      applicantComment: json['applicantComment'] as String?,
      expertComment: json['expertComment'] as String?,
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
  writeNotNull('amazonPathToFile', instance.amazonPathToFile);
  writeNotNull('applicantComment', instance.applicantComment);
  writeNotNull('expertComment', instance.expertComment);
  writeNotNull('grade', instance.grade);
  writeNotNull('dateTime', instance.dateTime?.toIso8601String());
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
