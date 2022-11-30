// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'c_viewer_service.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cv _$CvFromJson(Map<String, dynamic> json) => Cv(
      id: json['id'] as int?,
      name: json['name'] as String?,
      peopleCreatedId: json['peopleCreatedId'] as int?,
      specialization: specializationFromJson(json['specialization']),
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      tags: cVTagListFromJson(json['tags'] as List?),
    );

Map<String, dynamic> _$CvToJson(Cv instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'peopleCreatedId': instance.peopleCreatedId,
      'specialization': specializationToJson(instance.specialization),
      'description': instance.description,
      'rating': instance.rating,
      'tags': cVTagListToJson(instance.tags),
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String?,
      emailAddress: json['emailAddress'] as String?,
      biography: json['biography'] as String?,
      isReviewer: json['isReviewer'] as bool?,
      specializationId: json['specializationId'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      userRole: userRoleFromJson(json['userRole']),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'emailAddress': instance.emailAddress,
      'biography': instance.biography,
      'isReviewer': instance.isReviewer,
      'specializationId': instance.specializationId,
      'rating': instance.rating,
      'userRole': userRoleToJson(instance.userRole),
    };

UserCredentials _$UserCredentialsFromJson(Map<String, dynamic> json) =>
    UserCredentials(
      emailAddress: json['emailAddress'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserCredentialsToJson(UserCredentials instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'password': instance.password,
    };
