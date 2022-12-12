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
  Future<chopper.Response<ComplexObjectProfileAndToken>> signInPost(
      {required UserCredentials? body}) {
    generatedMapping.putIfAbsent(ComplexObjectProfileAndToken,
        () => ComplexObjectProfileAndToken.fromJsonFactory);

    return _signInPost(body: body);
  }

  ///
  @Post(path: '/sign_in')
  Future<chopper.Response<ComplexObjectProfileAndToken>> _signInPost(
      {@Body() required UserCredentials? body});

  ///
  Future<chopper.Response<ComplexObjectProfileAndToken>> signUpPost(
      {required UserCredentials? body}) {
    generatedMapping.putIfAbsent(ComplexObjectProfileAndToken,
        () => ComplexObjectProfileAndToken.fromJsonFactory);

    return _signUpPost(body: body);
  }

  ///
  @Post(path: '/sign_up')
  Future<chopper.Response<ComplexObjectProfileAndToken>> _signUpPost(
      {@Body() required UserCredentials? body});

  ///
  Future<chopper.Response> logoutPost() {
    return _logoutPost();
  }

  ///
  @Post(
    path: '/logout',
    optionalBody: true,
  )
  Future<chopper.Response> _logoutPost();

  ///
  ///@param profileId
  ///@param firstName
  ///@param lastName
  ///@param biography
  ///@param rating
  ///@param email
  ///@param password
  Future<chopper.Response<Profile>> updateProfilePut({
    required int? profileId,
    String? firstName,
    String? lastName,
    String? biography,
    num? rating,
    String? email,
    String? password,
    required Specialization? body,
  }) {
    generatedMapping.putIfAbsent(Profile, () => Profile.fromJsonFactory);

    return _updateProfilePut(
        profileId: profileId,
        firstName: firstName,
        lastName: lastName,
        biography: biography,
        rating: rating,
        email: email,
        password: password,
        body: body);
  }

  ///
  ///@param profileId
  ///@param firstName
  ///@param lastName
  ///@param biography
  ///@param rating
  ///@param email
  ///@param password
  @Put(path: '/update_profile')
  Future<chopper.Response<Profile>> _updateProfilePut({
    @Query('profileId') required int? profileId,
    @Query('firstName') String? firstName,
    @Query('lastName') String? lastName,
    @Query('biography') String? biography,
    @Query('rating') num? rating,
    @Query('email') String? email,
    @Query('password') String? password,
    @Body() required Specialization? body,
  });

  ///
  Future<chopper.Response<List<Profile>>> listProfilesGet() {
    generatedMapping.putIfAbsent(Profile, () => Profile.fromJsonFactory);

    return _listProfilesGet();
  }

  ///
  @Get(path: '/list_profiles')
  Future<chopper.Response<List<Profile>>> _listProfilesGet();

  ///
  Future<chopper.Response<Profile>> getProfileGet() {
    generatedMapping.putIfAbsent(Profile, () => Profile.fromJsonFactory);

    return _getProfileGet();
  }

  ///
  @Get(path: '/get_profile')
  Future<chopper.Response<Profile>> _getProfileGet();

  ///
  ///@param expertId
  Future<chopper.Response<Profile>> getExpertProfileGet(
      {required int? expertId}) {
    generatedMapping.putIfAbsent(Profile, () => Profile.fromJsonFactory);

    return _getExpertProfileGet(expertId: expertId);
  }

  ///
  ///@param expertId
  @Get(path: '/get_expert_profile')
  Future<chopper.Response<Profile>> _getExpertProfileGet(
      {@Query('expertId') required int? expertId});

  ///
  ///@param applicantId
  Future<chopper.Response<Profile>> getApplicantProfileGet(
      {required int? applicantId}) {
    generatedMapping.putIfAbsent(Profile, () => Profile.fromJsonFactory);

    return _getApplicantProfileGet(applicantId: applicantId);
  }

  ///
  ///@param applicantId
  @Get(path: '/get_applicant_profile')
  Future<chopper.Response<Profile>> _getApplicantProfileGet(
      {@Query('applicantId') required int? applicantId});

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
  ///@param fileName
  Future<chopper.Response> pinFileToDraftPost({
    String? fileName,
    List<int>? fileData,
  }) {
    return _pinFileToDraftPost(fileName: fileName, fileData: fileData);
  }

  ///
  ///@param fileName
  @Post(path: '/pin_file_to_draft')
  @Multipart()
  Future<chopper.Response> _pinFileToDraftPost({
    @Query('fileName') String? fileName,
    @PartFile() List<int>? fileData,
  });

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
  ///@param description
  Future<chopper.Response> updateCvInfoPost({
    required int? cvId,
    String? title,
    String? description,
    required TransitObjectSpecializationAndCVTags? body,
  }) {
    return _updateCvInfoPost(
        cvId: cvId, title: title, description: description, body: body);
  }

  ///
  ///@param cvId
  ///@param title
  ///@param description
  @Post(path: '/update_cv_info')
  Future<chopper.Response> _updateCvInfoPost({
    @Query('cvId') required int? cvId,
    @Query('title') String? title,
    @Query('description') String? description,
    @Body() required TransitObjectSpecializationAndCVTags? body,
  });

  ///
  Future<chopper.Response> addEventToHistoryGet(
      {required CVHistoryParameter? body}) {
    return _addEventToHistoryGet(body: body);
  }

  ///
  @Get(path: '/add_event_to_history')
  Future<chopper.Response> _addEventToHistoryGet(
      {@Body() required CVHistoryParameter? body});

  ///
  Future<chopper.Response<List<Cv>>> listCVsGet() {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _listCVsGet();
  }

  ///
  @Get(path: '/list_CVs')
  Future<chopper.Response<List<Cv>>> _listCVsGet();

  ///
  ///@param cvId
  Future<chopper.Response<Object>> getCvStatusGet({required int? cvId}) {
    return _getCvStatusGet(cvId: cvId);
  }

  ///
  ///@param cvId
  @Get(path: '/get_cv_status')
  Future<chopper.Response<Object>> _getCvStatusGet(
      {@Query('cvId') required int? cvId});

  ///
  Future<chopper.Response<List<Cv>>> listCVsForProfileGet() {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _listCVsForProfileGet();
  }

  ///
  @Get(path: '/list_CVs_for_profile')
  Future<chopper.Response<List<Cv>>> _listCVsForProfileGet();

  ///
  Future<chopper.Response<List<CVTag>>> listCVTagsGet() {
    generatedMapping.putIfAbsent(CVTag, () => CVTag.fromJsonFactory);

    return _listCVTagsGet();
  }

  ///
  @Get(path: '/list_CV_tags')
  Future<chopper.Response<List<CVTag>>> _listCVTagsGet();

  ///
  Future<chopper.Response> listSpecializationsGet() {
    return _listSpecializationsGet();
  }

  ///
  @Get(path: '/list_specializations')
  Future<chopper.Response> _listSpecializationsGet();

  ///
  ///@param cvId
  Future<chopper.Response<List<CVHistory>>> listConcreteCVHistoriesGet(
      {required int? cvId}) {
    generatedMapping.putIfAbsent(CVHistory, () => CVHistory.fromJsonFactory);

    return _listConcreteCVHistoriesGet(cvId: cvId);
  }

  ///
  ///@param cvId
  @Get(path: '/list_concrete_CV_histories')
  Future<chopper.Response<List<CVHistory>>> _listConcreteCVHistoriesGet(
      {@Query('cvId') required int? cvId});

  ///
  Future<chopper.Response> checkAccessGet() {
    return _checkAccessGet();
  }

  ///
  @Get(path: '/check_access')
  Future<chopper.Response> _checkAccessGet();
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
