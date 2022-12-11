import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends InheritedWidget {
  const ProfileProvider({
    super.key,
    required super.child,
    required this.profile,
  });

  final Profile profile;

  static Profile? of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ProfileProvider>();

    return provider?.profile;
  }

  @override
  bool updateShouldNotify(covariant ProfileProvider oldWidget) {
    return profile != oldWidget.profile;
  }
}
