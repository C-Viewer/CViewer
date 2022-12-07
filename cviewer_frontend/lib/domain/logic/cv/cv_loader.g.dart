// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_loader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CVLoader on _CVLoader, Store {
  late final _$cvAtom = Atom(name: '_CVLoader.cv', context: context);

  @override
  CV? get cv {
    _$cvAtom.reportRead();
    return super.cv;
  }

  @override
  set cv(CV? value) {
    _$cvAtom.reportWrite(value, super.cv, () {
      super.cv = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CVLoader.isLoading', context: context);

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
      Atom(name: '_CVLoader.hasLoadError', context: context);

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

  late final _$errorAtom = Atom(name: '_CVLoader.error', context: context);

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

  late final _$loadCVAsyncAction =
      AsyncAction('_CVLoader.loadCV', context: context);

  @override
  Future<void> loadCV(int cvId) {
    return _$loadCVAsyncAction.run(() => super.loadCV(cvId));
  }

  @override
  String toString() {
    return '''
cv: ${cv},
isLoading: ${isLoading},
hasLoadError: ${hasLoadError},
error: ${error}
    ''';
  }
}
