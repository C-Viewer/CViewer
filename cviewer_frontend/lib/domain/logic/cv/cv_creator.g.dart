// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_creator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CVCreator on _CVCreator, Store {
  late final _$tagsAtom = Atom(name: '_CVCreator.tags', context: context);

  @override
  List<CVTag>? get tags {
    _$tagsAtom.reportRead();
    return super.tags;
  }

  @override
  set tags(List<CVTag>? value) {
    _$tagsAtom.reportWrite(value, super.tags, () {
      super.tags = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CVCreator.isLoading', context: context);

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
      Atom(name: '_CVCreator.hasLoadError', context: context);

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

  late final _$errorAtom = Atom(name: '_CVCreator.error', context: context);

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
      Atom(name: '_CVCreator.fileName', context: context);

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

  late final _$loadTagsAsyncAction =
      AsyncAction('_CVCreator.loadTags', context: context);

  @override
  Future<void> loadTags() {
    return _$loadTagsAsyncAction.run(() => super.loadTags());
  }

  late final _$selectCVFileAsyncAction =
      AsyncAction('_CVCreator.selectCVFile', context: context);

  @override
  Future<void> selectCVFile() {
    return _$selectCVFileAsyncAction.run(() => super.selectCVFile());
  }

  late final _$removeCVFileAsyncAction =
      AsyncAction('_CVCreator.removeCVFile', context: context);

  @override
  Future<void> removeCVFile() {
    return _$removeCVFileAsyncAction.run(() => super.removeCVFile());
  }

  @override
  String toString() {
    return '''
tags: ${tags},
isLoading: ${isLoading},
hasLoadError: ${hasLoadError},
error: ${error},
fileName: ${fileName}
    ''';
  }
}
