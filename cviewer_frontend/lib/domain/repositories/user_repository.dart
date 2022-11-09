import 'package:cviewer_frontend/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}