import 'package:cviewer_frontend/domain/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  const UserProvider({
    super.key,
    required super.child,
    required this.user,
  });

  final User user;

  static User? of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<UserProvider>();

    return provider?.user;
  }

  @override
  bool updateShouldNotify(covariant UserProvider oldWidget) {
    return user != oldWidget.user;
  }
}
