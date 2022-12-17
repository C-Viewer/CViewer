import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/ui_models/bottom_tab_ui_model.dart';
import 'package:flutter/material.dart';

class BottomTabUiAdapter implements BottomTabUiModel {
  const BottomTabUiAdapter(
    this.context, {
    required this.profile,
  });

  final BuildContext context;
  final Profile? profile;

  @override
  IconData get homeIcon =>
      (profile?.isExpert == true) ? Icons.folder_outlined : Icons.star_rounded;

  @override
  String get homeLabel =>
      (profile?.isExpert == true) ? S.of(context).freeCV : S.of(context).bestCV;

  @override
  String get cvListLabel =>
      (profile?.isExpert == true) ? S.of(context).myReview : S.of(context).myCV;
}
