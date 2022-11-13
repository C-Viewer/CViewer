import 'package:cviewer_frontend/domain/models/user/user.dart';
import 'package:cviewer_frontend/domain/repositories/user_repository.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<User> getUser() async {
    return mockUser;
  }
}

// TODO: сделать приватным в будущем
const mockUser = User(
  id: '1',
  firstName: 'Ван',
  lastName: 'Даркхолм',
  description: ''' 
Эй приятель, я думаю ты ошибся дверью, кожаный клуб двумя этажами ниже.
Пошел ты!
Да пошел ты, кожевник! Может, нам с тобой стоит уладить это прямо здесь, на ринге, Если ты считаешь себя таким крутым...
О да? Я надеру тебе задницу!
Ха! Ага, мужик. Поехали! Почему бы тебе не избавиться от своих кожаных игрушек? Я избавлюсь от этого, и мы решим это прямо здесь, на ринге. Что скажешь?
Да Нет проблем, приятель!
Ты понял. Снимай эту хрень...
Ага, Умная Задница.
Я покажу тебе, Кто босс этой качалки!
''',
);
