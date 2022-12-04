// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cviewer_frontend/data/network/service/client_index.dart' as _i4;
import 'package:cviewer_frontend/di/mock_assemble.dart' as _i5;
import 'package:cviewer_frontend/di/real_assemble.dart' as _i6;
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart'
    as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final mockAssemble = _$MockAssemble();
    final realAssemble = _$RealAssemble();
    gh.factory<_i3.ProfileRepository>(
      () => mockAssemble.profileRepository(),
      registerFor: {_test},
    );
    gh.factory<String>(
      () => realAssemble.baseUrl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i4.CViewerService>(
      () => realAssemble.service(gh<String>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i3.ProfileRepository>(
      () => realAssemble.profileRepository(gh<_i4.CViewerService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    return this;
  }
}

class _$MockAssemble extends _i5.MockAssemble {}

class _$RealAssemble extends _i6.RealAssemble {}
