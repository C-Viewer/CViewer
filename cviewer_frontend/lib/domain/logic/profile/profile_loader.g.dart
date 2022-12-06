// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_loader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileLoader on _ProfileLoader, Store {
  late final _$profileAtom =
      Atom(name: '_ProfileLoader.profile', context: context);

  @override
  Profile? get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(Profile? value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProfileLoader.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasLoadErrorAtom =
      Atom(name: '_ProfileLoader.hasLoadError', context: context);

  @override
  bool get hasLoadError {
    _$hasLoadErrorAtom.reportRead();
    return super.hasLoadError;
  }

  @override
  set hasLoadError(bool value) {
    _$hasLoadErrorAtom.reportWrite(value, super.hasLoadError, () {
      super.hasLoadError = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ProfileLoader.error', context: context);

  @override
  Object? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Object? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadProfileAsyncAction =
      AsyncAction('_ProfileLoader.loadProfile', context: context);

  @override
  Future<void> loadProfile() {
    return _$loadProfileAsyncAction.run(() => super.loadProfile());
  }

  @override
  String toString() {
    return '''
profile: ${profile},
isLoading: ${isLoading},
hasLoadError: ${hasLoadError},
error: ${error}
    ''';
  }
}
