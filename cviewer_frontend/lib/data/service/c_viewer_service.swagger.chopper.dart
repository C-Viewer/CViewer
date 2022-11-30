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
  Future<Response<String>> _loginPost({required UserCredentials? body}) {
    final String $url = '/login';
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
  Future<Response<Cv>> _createPost({required Cv? body}) {
    final String $url = '/create';
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Cv, Cv>($request);
  }

  @override
  Future<Response<Cv>> _getGet({required int? id}) {
    final String $url = '/get';
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Cv, Cv>($request);
  }

  @override
  Future<Response<List<Cv>>> _listGet() {
    final String $url = '/list';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Cv>, Cv>($request);
  }

  @override
  Future<Response<Cv>> _updatePut({required Cv? body}) {
    final String $url = '/update';
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Cv, Cv>($request);
  }

  @override
  Future<Response<dynamic>> _deleteDelete({required int? id}) {
    final String $url = '/delete';
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _createProfilePost(
      {required UserCredentials? body}) {
    final String $url = '/createProfile';
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
  Future<Response<dynamic>> _getProfileInfoGet({required int? profileId}) {
    final String $url = '/getProfileInfo';
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
  Future<Response<dynamic>> _updateProfileInfoPut({required Profile? body}) {
    final String $url = '/updateProfileInfo';
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _listProfilesGet() {
    final String $url = '/listProfiles';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
