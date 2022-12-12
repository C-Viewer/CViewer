// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'c_viewer_service.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CViewerService extends CViewerService {
  _$CViewerService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CViewerService;

  @override
  Future<Response<ComplexObjectProfileAndToken>> _signInPost(
      {required UserCredentials? body}) {
    final String $url = '/sign_in';
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ComplexObjectProfileAndToken,
        ComplexObjectProfileAndToken>($request);
  }

  @override
  Future<Response<ComplexObjectProfileAndToken>> _signUpPost(
      {required UserCredentials? body}) {
    final String $url = '/sign_up';
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ComplexObjectProfileAndToken,
        ComplexObjectProfileAndToken>($request);
  }

  @override
  Future<Response<dynamic>> _logoutPost() {
    final String $url = '/logout';
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Profile>> _updateProfilePut({
    required int? profileId,
    String? firstName,
    String? lastName,
    String? biography,
    num? rating,
    String? email,
    String? password,
    required Specialization? body,
  }) {
    final String $url = '/update_profile';
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId,
      'firstName': firstName,
      'lastName': lastName,
      'biography': biography,
      'rating': rating,
      'email': email,
      'password': password,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<Profile, Profile>($request);
  }

  @override
  Future<Response<List<Profile>>> _listProfilesGet() {
    final String $url = '/list_profiles';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Profile>, Profile>($request);
  }

  @override
  Future<Response<Profile>> _getProfileGet() {
    final String $url = '/get_profile';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Profile, Profile>($request);
  }

  @override
  Future<Response<Profile>> _getExpertProfileGet({required int? expertId}) {
    final String $url = '/get_expert_profile';
    final Map<String, dynamic> $params = <String, dynamic>{
      'expertId': expertId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Profile, Profile>($request);
  }

  @override
  Future<Response<Profile>> _getApplicantProfileGet(
      {required int? applicantId}) {
    final String $url = '/get_applicant_profile';
    final Map<String, dynamic> $params = <String, dynamic>{
      'applicantId': applicantId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Profile, Profile>($request);
  }

  @override
  Future<Response<Cv>> _getCvGet({required int? cvId}) {
    final String $url = '/get_cv';
    final Map<String, dynamic> $params = <String, dynamic>{'cvId': cvId};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Cv, Cv>($request);
  }

  @override
  Future<Response<dynamic>> _pinFileToDraftPost({
    String? fileName,
    List<int>? fileData,
  }) {
    final String $url = '/pin_file_to_draft';
    final Map<String, dynamic> $params = <String, dynamic>{
      'fileName': fileName
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<List<int>?>(
        'fileData',
        fileData,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Cv>> _createCvDraftPost({
    required int? applicantId,
    required Cv? body,
  }) {
    final String $url = '/create_cv_draft';
    final Map<String, dynamic> $params = <String, dynamic>{
      'applicantId': applicantId
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<Cv, Cv>($request);
  }

  @override
  Future<Response<dynamic>> _updateCvInfoPost({
    required int? cvId,
    String? title,
    String? description,
    required TransitObjectSpecializationAndCVTags? body,
  }) {
    final String $url = '/update_cv_info';
    final Map<String, dynamic> $params = <String, dynamic>{
      'cvId': cvId,
      'title': title,
      'description': description,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _addEventToHistoryGet(
      {required CVHistoryParameter? body}) {
    final String $url = '/add_event_to_history';
    final $body = body;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Cv>>> _listCVsGet() {
    final String $url = '/list_CVs';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Cv>, Cv>($request);
  }

  @override
  Future<Response<Object>> _getCvStatusGet({required int? cvId}) {
    final String $url = '/get_cv_status';
    final Map<String, dynamic> $params = <String, dynamic>{'cvId': cvId};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<List<Cv>>> _listCVsForProfileGet() {
    final String $url = '/list_CVs_for_profile';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Cv>, Cv>($request);
  }

  @override
  Future<Response<List<CVTag>>> _listCVTagsGet() {
    final String $url = '/list_CV_tags';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CVTag>, CVTag>($request);
  }

  @override
  Future<Response<dynamic>> _listSpecializationsGet() {
    final String $url = '/list_specializations';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<CVHistory>>> _listConcreteCVHistoriesGet(
      {required int? cvId}) {
    final String $url = '/list_concrete_CV_histories';
    final Map<String, dynamic> $params = <String, dynamic>{'cvId': cvId};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<CVHistory>, CVHistory>($request);
  }

  @override
  Future<Response<dynamic>> _checkAccessGet() {
    final String $url = '/check_access';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
