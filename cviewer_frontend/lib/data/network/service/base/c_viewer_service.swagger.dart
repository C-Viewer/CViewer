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
    int? rating,
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
    @Query('rating') int? rating,
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
  ///@param profileId
  Future<chopper.Response<Profile>> getProfileByIdGet(
      {required int? profileId}) {
    generatedMapping.putIfAbsent(Profile, () => Profile.fromJsonFactory);

    return _getProfileByIdGet(profileId: profileId);
  }

  ///
  ///@param profileId
  @Get(path: '/get_profile_by_id')
  Future<chopper.Response<Profile>> _getProfileByIdGet(
      {@Query('profileId') required int? profileId});

  ///
  ///@param comment
  ///@param peopleId
  ///@param authorId
  ///@param mark
  Future<chopper.Response> addReportToProfilePost({
    String? comment,
    required int? peopleId,
    required int? authorId,
    required int? mark,
  }) {
    return _addReportToProfilePost(
        comment: comment, peopleId: peopleId, authorId: authorId, mark: mark);
  }

  ///
  ///@param comment
  ///@param peopleId
  ///@param authorId
  ///@param mark
  @Post(
    path: '/add_report_to_profile',
    optionalBody: true,
  )
  Future<chopper.Response> _addReportToProfilePost({
    @Query('comment') String? comment,
    @Query('peopleId') required int? peopleId,
    @Query('authorId') required int? authorId,
    @Query('mark') required int? mark,
  });

  ///
  ///@param date
  Future<chopper.Response<String>> generateCviewerReportGet(
      {required String? date}) {
    return _generateCviewerReportGet(date: date);
  }

  ///
  ///@param date
  @Get(path: '/generate_cviewer_report')
  Future<chopper.Response<String>> _generateCviewerReportGet(
      {@Query('date') required String? date});

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
  Future<chopper.Response<Cv>> createCvForReviewPost({
    ComplexCVAndIFormFile? cvDraft,
    List<int>? file,
  }) {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _createCvForReviewPost(cvDraft: cvDraft, file: file);
  }

  ///
  @Post(path: '/create_cv_for_review')
  @Multipart()
  Future<chopper.Response<Cv>> _createCvForReviewPost({
    @Part() ComplexCVAndIFormFile? cvDraft,
    @PartFile() List<int>? file,
  });

  ///
  ///@param cvId
  Future<chopper.Response> makeCvAsGoodPut({required int? cvId}) {
    return _makeCvAsGoodPut(cvId: cvId);
  }

  ///
  ///@param cvId
  @Put(
    path: '/make_cv_as_good',
    optionalBody: true,
  )
  Future<chopper.Response> _makeCvAsGoodPut(
      {@Query('cvId') required int? cvId});

  ///
  Future<chopper.Response<List<Cv>>> listGoodCvsGet() {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _listGoodCvsGet();
  }

  ///
  @Get(path: '/list_good_cvs')
  Future<chopper.Response<List<Cv>>> _listGoodCvsGet();

  ///
  Future<chopper.Response<List<Cv>>> listCvsOpenedForReviewGet() {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _listCvsOpenedForReviewGet();
  }

  ///
  @Get(path: '/list_cvs_opened_for_review')
  Future<chopper.Response<List<Cv>>> _listCvsOpenedForReviewGet();

  ///
  ///@param cvId
  Future<chopper.Response> takeCvToReviewPut({required int? cvId}) {
    return _takeCvToReviewPut(cvId: cvId);
  }

  ///
  ///@param cvId
  @Put(
    path: '/take_cv_to_review',
    optionalBody: true,
  )
  Future<chopper.Response> _takeCvToReviewPut(
      {@Query('cvId') required int? cvId});

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
  Future<chopper.Response<CVHistory>> addEventToHistoryPost({
    ComplexCVHistoryParameterAndFIle? cvHistoryParameter,
    List<int>? file,
  }) {
    generatedMapping.putIfAbsent(CVHistory, () => CVHistory.fromJsonFactory);

    return _addEventToHistoryPost(
        cvHistoryParameter: cvHistoryParameter, file: file);
  }

  ///
  @Post(path: '/add_event_to_history')
  @Multipart()
  Future<chopper.Response<CVHistory>> _addEventToHistoryPost({
    @Part() ComplexCVHistoryParameterAndFIle? cvHistoryParameter,
    @PartFile() List<int>? file,
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
  Future<chopper.Response<List<Specialization>>> listSpecializationsGet() {
    generatedMapping.putIfAbsent(
        Specialization, () => Specialization.fromJsonFactory);

    return _listSpecializationsGet();
  }

  ///
  @Get(path: '/list_specializations')
  Future<chopper.Response<List<Specialization>>> _listSpecializationsGet();

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
  ///@param cvId
  Future<chopper.Response> finishCvReviewPut({required int? cvId}) {
    return _finishCvReviewPut(cvId: cvId);
  }

  ///
  ///@param cvId
  @Put(
    path: '/finish_cv_review',
    optionalBody: true,
  )
  Future<chopper.Response> _finishCvReviewPut(
      {@Query('cvId') required int? cvId});

  ///
  Future<chopper.Response> checkAccessGet() {
    return _checkAccessGet();
  }

  ///
  @Get(path: '/check_access')
  Future<chopper.Response> _checkAccessGet();

  ///
  Future<chopper.Response<List<String>>> listAllCvFileNamesTestGet() {
    return _listAllCvFileNamesTestGet();
  }

  ///
  @Get(path: '/list_all_cv_file_names-test')
  Future<chopper.Response<List<String>>> _listAllCvFileNamesTestGet();

  ///
  ///@param fileKeyInAmazonBucket
  Future<chopper.Response> storeFilePut({
    String? fileKeyInAmazonBucket,
    List<int>? stream,
  }) {
    return _storeFilePut(
        fileKeyInAmazonBucket: fileKeyInAmazonBucket, stream: stream);
  }

  ///
  ///@param fileKeyInAmazonBucket
  @Put(path: '/store_file')
  @Multipart()
  Future<chopper.Response> _storeFilePut({
    @Query('fileKeyInAmazonBucket') String? fileKeyInAmazonBucket,
    @PartFile() List<int>? stream,
  });

  ///
  ///@param fileKeyInAmazonBucket
  Future<chopper.Response<String>> getUrlToCvFileGet(
      {String? fileKeyInAmazonBucket}) {
    return _getUrlToCvFileGet(fileKeyInAmazonBucket: fileKeyInAmazonBucket);
  }

  ///
  ///@param fileKeyInAmazonBucket
  @Get(path: '/get_url_to_cv_file')
  Future<chopper.Response<String>> _getUrlToCvFileGet(
      {@Query('fileKeyInAmazonBucket') String? fileKeyInAmazonBucket});

  ///
  ///@param fileKeyInAmazonBucket
  Future<chopper.Response<String>> getSerializedFileStreamTestGet(
      {String? fileKeyInAmazonBucket}) {
    return _getSerializedFileStreamTestGet(
        fileKeyInAmazonBucket: fileKeyInAmazonBucket);
  }

  ///
  ///@param fileKeyInAmazonBucket
  @Get(path: '/get_serialized_file_stream-test')
  Future<chopper.Response<String>> _getSerializedFileStreamTestGet(
      {@Query('fileKeyInAmazonBucket') String? fileKeyInAmazonBucket});

  ///
  ///@param fileKeyInAmazonBucket
  Future<chopper.Response> deleteFileTestDelete(
      {String? fileKeyInAmazonBucket}) {
    return _deleteFileTestDelete(fileKeyInAmazonBucket: fileKeyInAmazonBucket);
  }

  ///
  ///@param fileKeyInAmazonBucket
  @Delete(path: '/delete_file-test')
  Future<chopper.Response> _deleteFileTestDelete(
      {@Query('fileKeyInAmazonBucket') String? fileKeyInAmazonBucket});
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
