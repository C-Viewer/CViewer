import 'package:cviewer_frontend/domain/models/user/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}