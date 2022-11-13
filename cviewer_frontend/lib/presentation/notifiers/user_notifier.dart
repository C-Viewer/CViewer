import 'package:cviewer_frontend/domain/models/user/user.dart';
import 'package:flutter/foundation.dart';

class UserNotifier with ChangeNotifier implements ValueListenable<User> {
  @override
  User get value => throw UnimplementedError();
}
