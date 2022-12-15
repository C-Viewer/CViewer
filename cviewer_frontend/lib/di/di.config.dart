// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cviewer_frontend/data/network/service/client_index.dart' as _i6;
import 'package:cviewer_frontend/data/network/service/file/file_c_viewer_service.dart'
    as _i7;
import 'package:cviewer_frontend/di/mock_assemble.dart' as _i9;
import 'package:cviewer_frontend/di/real_assemble.dart' as _i10;
import 'package:cviewer_frontend/domain/repositories/auth_repository.dart'
    as _i8;
import 'package:cviewer_frontend/domain/repositories/cv_repository.dart' as _i3;
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

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
    gh.factory<_i3.CVRepository>(
      () => mockAssemble.cvRepository(),
      registerFor: {_test},
    );
    gh.factory<_i4.ProfileRepository>(
      () => mockAssemble.profileRepository(),
      registerFor: {_test},
    );
    gh.factory<_i5.SharedPreferences>(
      () => realAssemble.storage(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<String>(
      () => realAssemble.baseUrl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i6.CViewerService>(
      () => realAssemble.service(
        gh<String>(),
        gh<_i5.SharedPreferences>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i7.FileCViewerService>(
      () => realAssemble.fileService(
        gh<String>(),
        gh<_i5.SharedPreferences>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i4.ProfileRepository>(
      () => realAssemble.profileRepository(
        gh<_i6.CViewerService>(),
        gh<_i5.SharedPreferences>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i8.AuthRepository>(
      () => realAssemble.authRepository(
        gh<_i6.CViewerService>(),
        gh<_i5.SharedPreferences>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i3.CVRepository>(
      () => realAssemble.cvRepository(
        gh<_i6.CViewerService>(),
        gh<_i7.FileCViewerService>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    return this;
  }
}

class _$MockAssemble extends _i9.MockAssemble {}

class _$RealAssemble extends _i10.RealAssemble {}
