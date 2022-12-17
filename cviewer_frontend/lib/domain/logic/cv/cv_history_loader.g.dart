// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_history_loader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CVHistoryLoader on _CVHistoryLoader, Store {
  late final _$cvHistoryAtom =
      Atom(name: '_CVHistoryLoader.cvHistory', context: context);

  @override
  CVHistory? get cvHistory {
    _$cvHistoryAtom.reportRead();
    return super.cvHistory;
  }

  @override
  set cvHistory(CVHistory? value) {
    _$cvHistoryAtom.reportWrite(value, super.cvHistory, () {
      super.cvHistory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CVHistoryLoader.isLoading', context: context);

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
      Atom(name: '_CVHistoryLoader.hasLoadError', context: context);

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

  late final _$errorAtom =
      Atom(name: '_CVHistoryLoader.error', context: context);

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

  late final _$loadCVHistoryAsyncAction =
      AsyncAction('_CVHistoryLoader.loadCVHistory', context: context);

  @override
  Future<void> loadCVHistory() {
    return _$loadCVHistoryAsyncAction.run(() => super.loadCVHistory());
  }

  late final _$startReviewAsyncAction =
      AsyncAction('_CVHistoryLoader.startReview', context: context);

  @override
  Future<bool> startReview() {
    return _$startReviewAsyncAction.run(() => super.startReview());
  }

  late final _$finishReviewAsyncAction =
      AsyncAction('_CVHistoryLoader.finishReview', context: context);

  @override
  Future<bool> finishReview() {
    return _$finishReviewAsyncAction.run(() => super.finishReview());
  }

  @override
  String toString() {
    return '''
cvHistory: ${cvHistory},
isLoading: ${isLoading},
hasLoadError: ${hasLoadError},
error: ${error}
    ''';
  }
}
