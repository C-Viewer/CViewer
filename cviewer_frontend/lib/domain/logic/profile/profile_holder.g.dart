// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_holder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileHolder on _ProfileHolder, Store {
  late final _$profileAtom =
      Atom(name: '_ProfileHolder.profile', context: context);

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

  late final _$loadProfileAsyncAction =
      AsyncAction('_ProfileHolder.loadProfile', context: context);

  @override
  Future<void> loadProfile() {
    return _$loadProfileAsyncAction.run(() => super.loadProfile());
  }

  @override
  String toString() {
    return '''
profile: ${profile}
    ''';
  }
}
