import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/ui_models/tab_label_ui_model.dart';
import 'package:flutter/widgets.dart';

class TabLabelUiAdapter implements TabLabelUiModel {
  const TabLabelUiAdapter(
    this.context, {
    required this.profile,
  });

  final BuildContext context;
  final Profile? profile;

  @override
  String get homeLabel =>
      (profile?.isExpert ?? false) ? S.of(context).cvBase : S.of(context).topCV;

  @override
  String get cvListLabel => (profile?.isExpert ?? false)
      ? S.of(context).myReview
      : S.of(context).myCV;
}
