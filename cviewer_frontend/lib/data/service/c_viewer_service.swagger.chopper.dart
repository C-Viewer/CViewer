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
  Future<Response<String>> _signInPost({required UserCredentials? body}) {
    final String $url = '/sign_in';
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<String, String>($request);
  }

  @override
  Future<Response<dynamic>> _signUpPost({required UserCredentials? body}) {
    final String $url = '/sign_up';
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _updateProfilePut({
    required int? profileId,
    String? firstName,
    String? lastName,
    String? biography,
    num? rating,
    String? email,
    String? password,
    int? specializationId,
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
      'specializationId': specializationId,
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _listProfilesGet() {
    final String $url = '/list_profiles';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _getProfileGet({required int? profileId}) {
    final String $url = '/get_profile';
    final Map<String, dynamic> $params = <String, dynamic>{
      'profileId': profileId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
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
  Future<Response<CVHistory>> _getCvHistoryGet({required int? cvHistoryId}) {
    final String $url = '/get_cv_history';
    final Map<String, dynamic> $params = <String, dynamic>{
      'cvHistoryId': cvHistoryId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<CVHistory, CVHistory>($request);
  }

  @override
  Future<Response<AttachedFile>> _getAttachedFileGet(
      {required int? attachedFileId}) {
    final String $url = '/get_attached_file';
    final Map<String, dynamic> $params = <String, dynamic>{
      'attachedFileId': attachedFileId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<AttachedFile, AttachedFile>($request);
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
    String? specialization,
    String? description,
    required dynamic body,
  }) {
    final String $url = '/update_cv_info';
    final Map<String, dynamic> $params = <String, dynamic>{
      'cvId': cvId,
      'title': title,
      'specialization': specialization,
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
  Future<Response<dynamic>> _addEventToHistoryGet({
    required int? cvId,
    String? fileName,
    String? applicantComment,
    String? expertComment,
    required String? dateTime,
  }) {
    final String $url = '/add_event_to_history';
    final Map<String, dynamic> $params = <String, dynamic>{
      'cvId': cvId,
      'fileName': fileName,
      'applicantComment': applicantComment,
      'expertComment': expertComment,
      'dateTime': dateTime,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
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
  Future<Response<List<CVHistory>>> _listCVHistoriesGet() {
    final String $url = '/list_CV_histories';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CVHistory>, CVHistory>($request);
  }

  @override
  Future<Response<List<AttachedFile>>> _listAttachedFilesGet() {
    final String $url = '/list_attached_files';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<AttachedFile>, AttachedFile>($request);
  }
}