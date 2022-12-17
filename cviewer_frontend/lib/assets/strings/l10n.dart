// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Вход в CViewer`
  String get authTitle {
    return Intl.message(
      'Вход в CViewer',
      name: 'authTitle',
      desc: '',
      args: [],
    );
  }

  /// `Почта`
  String get email {
    return Intl.message(
      'Почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get signIn {
    return Intl.message(
      'Войти',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get signUp {
    return Intl.message(
      'Зарегистрироваться',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `База CV`
  String get cvBase {
    return Intl.message(
      'База CV',
      name: 'cvBase',
      desc: '',
      args: [],
    );
  }

  /// `Топ CV`
  String get topCV {
    return Intl.message(
      'Топ CV',
      name: 'topCV',
      desc: '',
      args: [],
    );
  }

  /// `Мои CV`
  String get myCV {
    return Intl.message(
      'Мои CV',
      name: 'myCV',
      desc: '',
      args: [],
    );
  }

  /// `Мои ревью`
  String get myReview {
    return Intl.message(
      'Мои ревью',
      name: 'myReview',
      desc: '',
      args: [],
    );
  }

  /// `Черновик`
  String get draft {
    return Intl.message(
      'Черновик',
      name: 'draft',
      desc: '',
      args: [],
    );
  }

  /// `Опубликовано`
  String get availableForReview {
    return Intl.message(
      'Опубликовано',
      name: 'availableForReview',
      desc: '',
      args: [],
    );
  }

  /// `На проверке`
  String get onReview {
    return Intl.message(
      'На проверке',
      name: 'onReview',
      desc: '',
      args: [],
    );
  }

  /// `Нужно исправить`
  String get fixRequired {
    return Intl.message(
      'Нужно исправить',
      name: 'fixRequired',
      desc: '',
      args: [],
    );
  }

  /// `Проверено`
  String get reviewed {
    return Intl.message(
      'Проверено',
      name: 'reviewed',
      desc: '',
      args: [],
    );
  }

  /// `Оценено`
  String get marked {
    return Intl.message(
      'Оценено',
      name: 'marked',
      desc: '',
      args: [],
    );
  }

  /// `Завершено`
  String get finished {
    return Intl.message(
      'Завершено',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `Вы`
  String get you {
    return Intl.message(
      'Вы',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `Создание CV`
  String get cvCreator {
    return Intl.message(
      'Создание CV',
      name: 'cvCreator',
      desc: '',
      args: [],
    );
  }

  /// `Создать CV`
  String get createCV {
    return Intl.message(
      'Создать CV',
      name: 'createCV',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get title {
    return Intl.message(
      'Название',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Введите название CV`
  String get titleHint {
    return Intl.message(
      'Введите название CV',
      name: 'titleHint',
      desc: '',
      args: [],
    );
  }

  /// `Теги`
  String get tags {
    return Intl.message(
      'Теги',
      name: 'tags',
      desc: '',
      args: [],
    );
  }

  /// `CV`
  String get cv {
    return Intl.message(
      'CV',
      name: 'cv',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get firstName {
    return Intl.message(
      'Имя',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get lastName {
    return Intl.message(
      'Фамилия',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Специальность`
  String get speciality {
    return Intl.message(
      'Специальность',
      name: 'speciality',
      desc: '',
      args: [],
    );
  }

  /// `Биография`
  String get biography {
    return Intl.message(
      'Биография',
      name: 'biography',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message(
      'Редактировать',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Не указано`
  String get propertyPlaceholder {
    return Intl.message(
      'Не указано',
      name: 'propertyPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Повторить`
  String get tryAgain {
    return Intl.message(
      'Повторить',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Комментарий`
  String get comment {
    return Intl.message(
      'Комментарий',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Завершить`
  String get finish {
    return Intl.message(
      'Завершить',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Оценить`
  String get rate {
    return Intl.message(
      'Оценить',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Взять на ревью`
  String get startReview {
    return Intl.message(
      'Взять на ревью',
      name: 'startReview',
      desc: '',
      args: [],
    );
  }

  /// `Доступ запрещен, пожалуйста, попробуйте заново авторизоваться`
  String get noAccessError {
    return Intl.message(
      'Доступ запрещен, пожалуйста, попробуйте заново авторизоваться',
      name: 'noAccessError',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось загрузить данные, пожалуйста, повторите попытку`
  String get noDataError {
    return Intl.message(
      'Не удалось загрузить данные, пожалуйста, повторите попытку',
      name: 'noDataError',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка валидации введенных данных`
  String get validationError {
    return Intl.message(
      'Ошибка валидации введенных данных',
      name: 'validationError',
      desc: '',
      args: [],
    );
  }

  /// `По вашему запросу ничего не найдено`
  String get noFoundError {
    return Intl.message(
      'По вашему запросу ничего не найдено',
      name: 'noFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Неизвестная ошибка, пожалуйста, обратитесь в службу поддержки`
  String get unknownError {
    return Intl.message(
      'Неизвестная ошибка, пожалуйста, обратитесь в службу поддержки',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
