// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_history_event_creator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CVHistoryEventCreator on _CVHistoryEventCreator, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CVHistoryEventCreator.isLoading', context: context);

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
      Atom(name: '_CVHistoryEventCreator.hasLoadError', context: context);

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
      Atom(name: '_CVHistoryEventCreator.error', context: context);

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

  late final _$fileNameAtom =
      Atom(name: '_CVHistoryEventCreator.fileName', context: context);

  @override
  String? get fileName {
    _$fileNameAtom.reportRead();
    return super.fileName;
  }

  @override
  set fileName(String? value) {
    _$fileNameAtom.reportWrite(value, super.fileName, () {
      super.fileName = value;
    });
  }

  late final _$selectFileAsyncAction =
      AsyncAction('_CVHistoryEventCreator.selectFile', context: context);

  @override
  Future<void> selectFile() {
    return _$selectFileAsyncAction.run(() => super.selectFile());
  }

  late final _$removeFileAsyncAction =
      AsyncAction('_CVHistoryEventCreator.removeFile', context: context);

  @override
  Future<void> removeFile() {
    return _$removeFileAsyncAction.run(() => super.removeFile());
  }

  late final _$createEventAsyncAction =
      AsyncAction('_CVHistoryEventCreator.createEvent', context: context);

  @override
  Future<bool> createEvent({required String? comment, required int? grade}) {
    return _$createEventAsyncAction
        .run(() => super.createEvent(comment: comment, grade: grade));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasLoadError: ${hasLoadError},
error: ${error},
fileName: ${fileName}
    ''';
  }
}
