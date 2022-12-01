import 'c_viewer_service.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;
import 'c_viewer_service.enums.swagger.dart' as enums;
export 'c_viewer_service.enums.swagger.dart';
export 'c_viewer_service.models.swagger.dart';

part 'c_viewer_service.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class CViewerService extends ChopperService {
  static CViewerService create({
    ChopperClient? client,
    Authenticator? authenticator,
    String? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$CViewerService(client);
    }

    final newClient = ChopperClient(
        services: [_$CViewerService()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? 'http://');
    return _$CViewerService(newClient);
  }

  ///
  Future<chopper.Response<String>> signInPost(
      {required UserCredentials? body}) {
    return _signInPost(body: body);
  }

  ///
  @Post(path: '/sign_in')
  Future<chopper.Response<String>> _signInPost(
      {@Body() required UserCredentials? body});

  ///
  Future<chopper.Response> signUpPost({required UserCredentials? body}) {
    return _signUpPost(body: body);
  }

  ///
  @Post(path: '/sign_up')
  Future<chopper.Response> _signUpPost(
      {@Body() required UserCredentials? body});

  ///
  ///@param profileId
  ///@param firstName
  ///@param lastName
  ///@param biography
  ///@param rating
  ///@param email
  ///@param password
  ///@param specializationId
  Future<chopper.Response> updateProfilePut({
    required int? profileId,
    String? firstName,
    String? lastName,
    String? biography,
    num? rating,
    String? email,
    String? password,
    int? specializationId,
  }) {
    return _updateProfilePut(
        profileId: profileId,
        firstName: firstName,
        lastName: lastName,
        biography: biography,
        rating: rating,
        email: email,
        password: password,
        specializationId: specializationId);
  }

  ///
  ///@param profileId
  ///@param firstName
  ///@param lastName
  ///@param biography
  ///@param rating
  ///@param email
  ///@param password
  ///@param specializationId
  @Put(
    path: '/update_profile',
    optionalBody: true,
  )
  Future<chopper.Response> _updateProfilePut({
    @Query('profileId') required int? profileId,
    @Query('firstName') String? firstName,
    @Query('lastName') String? lastName,
    @Query('biography') String? biography,
    @Query('rating') num? rating,
    @Query('email') String? email,
    @Query('password') String? password,
    @Query('specializationId') int? specializationId,
  });

  ///
  Future<chopper.Response> listProfilesGet() {
    return _listProfilesGet();
  }

  ///
  @Get(path: '/list_profiles')
  Future<chopper.Response> _listProfilesGet();

  ///
  ///@param profileId
  Future<chopper.Response> getProfileGet({required int? profileId}) {
    return _getProfileGet(profileId: profileId);
  }

  ///
  ///@param profileId
  @Get(path: '/get_profile')
  Future<chopper.Response> _getProfileGet(
      {@Query('profileId') required int? profileId});

  ///
  ///@param cvId
  Future<chopper.Response<Cv>> getCvGet({required int? cvId}) {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _getCvGet(cvId: cvId);
  }

  ///
  ///@param cvId
  @Get(path: '/get_cv')
  Future<chopper.Response<Cv>> _getCvGet({@Query('cvId') required int? cvId});

  ///
  ///@param cvHistoryId
  Future<chopper.Response<CVHistory>> getCvHistoryGet(
      {required int? cvHistoryId}) {
    generatedMapping.putIfAbsent(CVHistory, () => CVHistory.fromJsonFactory);

    return _getCvHistoryGet(cvHistoryId: cvHistoryId);
  }

  ///
  ///@param cvHistoryId
  @Get(path: '/get_cv_history')
  Future<chopper.Response<CVHistory>> _getCvHistoryGet(
      {@Query('cvHistoryId') required int? cvHistoryId});

  ///
  ///@param attachedFileId
  Future<chopper.Response<AttachedFile>> getAttachedFileGet(
      {required int? attachedFileId}) {
    generatedMapping.putIfAbsent(
        AttachedFile, () => AttachedFile.fromJsonFactory);

    return _getAttachedFileGet(attachedFileId: attachedFileId);
  }

  ///
  ///@param attachedFileId
  @Get(path: '/get_attached_file')
  Future<chopper.Response<AttachedFile>> _getAttachedFileGet(
      {@Query('attachedFileId') required int? attachedFileId});

  ///
  ///@param applicantId
  Future<chopper.Response<Cv>> createCvDraftPost({
    required int? applicantId,
    required Cv? body,
  }) {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _createCvDraftPost(applicantId: applicantId, body: body);
  }

  ///
  ///@param applicantId
  @Post(path: '/create_cv_draft')
  Future<chopper.Response<Cv>> _createCvDraftPost({
    @Query('applicantId') required int? applicantId,
    @Body() required Cv? body,
  });

  ///
  ///@param cvId
  ///@param title
  ///@param specialization
  ///@param description
  Future<chopper.Response> updateCvInfoPost({
    required int? cvId,
    String? title,
    String? specialization,
    String? description,
    required List<enums.CVTag>? body,
  }) {
    return _updateCvInfoPost(
        cvId: cvId,
        title: title,
        specialization: specialization,
        description: description,
        body: cVTagListToJson(body));
  }

  ///
  ///@param cvId
  ///@param title
  ///@param specialization
  ///@param description
  @Post(path: '/update_cv_info')
  Future<chopper.Response> _updateCvInfoPost({
    @Query('cvId') required int? cvId,
    @Query('title') String? title,
    @Query('specialization') String? specialization,
    @Query('description') String? description,
    @Body() required dynamic body,
  });

  ///
  ///@param cvId
  ///@param fileName
  ///@param applicantComment
  ///@param expertComment
  ///@param dateTime
  Future<chopper.Response> addEventToHistoryGet({
    required int? cvId,
    String? fileName,
    String? applicantComment,
    String? expertComment,
    required String? dateTime,
  }) {
    return _addEventToHistoryGet(
        cvId: cvId,
        fileName: fileName,
        applicantComment: applicantComment,
        expertComment: expertComment,
        dateTime: dateTime);
  }

  ///
  ///@param cvId
  ///@param fileName
  ///@param applicantComment
  ///@param expertComment
  ///@param dateTime
  @Get(path: '/add_event_to_history')
  Future<chopper.Response> _addEventToHistoryGet({
    @Query('cvId') required int? cvId,
    @Query('fileName') String? fileName,
    @Query('applicantComment') String? applicantComment,
    @Query('expertComment') String? expertComment,
    @Query('dateTime') required String? dateTime,
  });

  ///
  Future<chopper.Response<List<Cv>>> listCVsGet() {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _listCVsGet();
  }

  ///
  @Get(path: '/list_CVs')
  Future<chopper.Response<List<Cv>>> _listCVsGet();

  ///
  Future<chopper.Response<List<CVHistory>>> listCVHistoriesGet() {
    generatedMapping.putIfAbsent(CVHistory, () => CVHistory.fromJsonFactory);

    return _listCVHistoriesGet();
  }

  ///
  @Get(path: '/list_CV_histories')
  Future<chopper.Response<List<CVHistory>>> _listCVHistoriesGet();

  ///
  Future<chopper.Response<List<AttachedFile>>> listAttachedFilesGet() {
    generatedMapping.putIfAbsent(
        AttachedFile, () => AttachedFile.fromJsonFactory);

    return _listAttachedFilesGet();
  }

  ///
  @Get(path: '/list_attached_files')
  Future<chopper.Response<List<AttachedFile>>> _listAttachedFilesGet();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);