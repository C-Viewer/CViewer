// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cviewer_frontend/di/mock_assemble.dart' as _i5;
import 'package:cviewer_frontend/domain/repositories/cv_repository.dart' as _i3;
import 'package:cviewer_frontend/domain/repositories/profile_repository.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _test = 'test';

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
    gh.factory<_i3.CVRepository>(
      () => mockAssemble.cvRepository(),
      registerFor: {_test},
    );
    gh.factory<_i4.ProfileRepository>(
      () => mockAssemble.profileRepository(),
      registerFor: {_test},
    );
    return this;
  }
}

class _$MockAssemble extends _i5.MockAssemble {}
