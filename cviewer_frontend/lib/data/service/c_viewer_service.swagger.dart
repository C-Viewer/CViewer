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
  Future<chopper.Response<String>> loginPost({required UserCredentials? body}) {
    return _loginPost(body: body);
  }

  ///
  @Post(path: '/login')
  Future<chopper.Response<String>> _loginPost(
      {@Body() required UserCredentials? body});

  ///
  Future<chopper.Response<Cv>> createPost({required Cv? body}) {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _createPost(body: body);
  }

  ///
  @Post(path: '/create')
  Future<chopper.Response<Cv>> _createPost({@Body() required Cv? body});

  ///
  ///@param id
  Future<chopper.Response<Cv>> getGet({required int? id}) {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _getGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/get')
  Future<chopper.Response<Cv>> _getGet({@Query('id') required int? id});

  ///
  Future<chopper.Response<List<Cv>>> listGet() {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _listGet();
  }

  ///
  @Get(path: '/list')
  Future<chopper.Response<List<Cv>>> _listGet();

  ///
  Future<chopper.Response<Cv>> updatePut({required Cv? body}) {
    generatedMapping.putIfAbsent(Cv, () => Cv.fromJsonFactory);

    return _updatePut(body: body);
  }

  ///
  @Put(path: '/update')
  Future<chopper.Response<Cv>> _updatePut({@Body() required Cv? body});

  ///
  ///@param id
  Future<chopper.Response> deleteDelete({required int? id}) {
    return _deleteDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/delete')
  Future<chopper.Response> _deleteDelete({@Query('id') required int? id});

  ///
  Future<chopper.Response> createProfilePost({required UserCredentials? body}) {
    return _createProfilePost(body: body);
  }

  ///
  @Post(path: '/createProfile')
  Future<chopper.Response> _createProfilePost(
      {@Body() required UserCredentials? body});

  ///
  ///@param profileId
  Future<chopper.Response> getProfileInfoGet({required int? profileId}) {
    return _getProfileInfoGet(profileId: profileId);
  }

  ///
  ///@param profileId
  @Get(path: '/getProfileInfo')
  Future<chopper.Response> _getProfileInfoGet(
      {@Query('profileId') required int? profileId});

  ///
  Future<chopper.Response> updateProfileInfoPut({required Profile? body}) {
    return _updateProfileInfoPut(body: body);
  }

  ///
  @Put(path: '/updateProfileInfo')
  Future<chopper.Response> _updateProfileInfoPut(
      {@Body() required Profile? body});

  ///
  Future<chopper.Response> listProfilesGet() {
    return _listProfilesGet();
  }

  ///
  @Get(path: '/listProfiles')
  Future<chopper.Response> _listProfilesGet();
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
