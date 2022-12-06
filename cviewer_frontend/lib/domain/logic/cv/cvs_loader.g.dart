// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cvs_loader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CVsLoader on _CVsLoader, Store {
  late final _$cvsAtom = Atom(name: '_CVsLoader.cvs', context: context);

  @override
  List<CV> get cvs {
    _$cvsAtom.reportRead();
    return super.cvs;
  }

  @override
  set cvs(List<CV> value) {
    _$cvsAtom.reportWrite(value, super.cvs, () {
      super.cvs = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CVsLoader.isLoading', context: context);

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
      Atom(name: '_CVsLoader.hasLoadError', context: context);

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

  late final _$errorAtom = Atom(name: '_CVsLoader.error', context: context);

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

  late final _$loadCVsAsyncAction =
      AsyncAction('_CVsLoader.loadCVs', context: context);

  @override
  Future<void> loadCVs() {
    return _$loadCVsAsyncAction.run(() => super.loadCVs());
  }

  @override
  String toString() {
    return '''
cvs: ${cvs},
isLoading: ${isLoading},
hasLoadError: ${hasLoadError},
error: ${error}
    ''';
  }
}
