// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthManager on _AuthManager, Store {
  late final _$isAuthorizedAtom =
      Atom(name: '_AuthManager.isAuthorized', context: context);

  @override
  bool get isAuthorized {
    _$isAuthorizedAtom.reportRead();
    return super.isAuthorized;
  }

  @override
  set isAuthorized(bool value) {
    _$isAuthorizedAtom.reportWrite(value, super.isAuthorized, () {
      super.isAuthorized = value;
    });
  }

  late final _$errorAtom = Atom(name: '_AuthManager.error', context: context);

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

  late final _$checkAccessAsyncAction =
      AsyncAction('_AuthManager.checkAccess', context: context);

  @override
  Future<void> checkAccess() {
    return _$checkAccessAsyncAction.run(() => super.checkAccess());
  }

  late final _$signInAsyncAction =
      AsyncAction('_AuthManager.signIn', context: context);

  @override
  Future<void> signIn({required ProfileCredentials credentials}) {
    return _$signInAsyncAction
        .run(() => super.signIn(credentials: credentials));
  }

  @override
  String toString() {
    return '''
isAuthorized: ${isAuthorized},
error: ${error}
    ''';
  }
}
