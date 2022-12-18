// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_finish_reporter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CVFinishReporter on _CVFinishReporter, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CVFinishReporter.isLoading', context: context);

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

  late final _$errorAtom =
      Atom(name: '_CVFinishReporter.error', context: context);

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

  late final _$sendReportAsyncAction =
      AsyncAction('_CVFinishReporter.sendReport', context: context);

  @override
  Future<bool> sendReport(
      {required int grade,
      required String? comment,
      required bool markCVAsBest}) {
    return _$sendReportAsyncAction.run(() => super.sendReport(
        grade: grade, comment: comment, markCVAsBest: markCVAsBest));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
