
import 'package:hive_flutter/adapters.dart';

import 'auth_holder.dart';

class AuthPrefs extends AuthHolder {
  late Box authBox;

  AuthPrefs() {
    authBox = Hive.box(authBoxID);
  }

  @override
  String get authToken => authBox.get(authTokenId, defaultValue: '');

  @override
  set authToken(String token) => authBox.put(authTokenId, token);

  @override
  String get username => authBox.get(usernameId, defaultValue: '');

  @override
  set username(String name) => authBox.put(usernameId, name);

  @override
  String get firstName => authBox.get(firstNameId, defaultValue: '');

  @override
  set firstName(String name) => authBox.put(firstNameId, name);

  @override
  String get lastName => authBox.get(lastNameId, defaultValue: '');

  @override
  set lastName(String name) => authBox.put(lastNameId, name);

  @override
  String get email => authBox.get(emailId, defaultValue: '');

  @override
  set email(String name) => authBox.put(emailId, name);

  @override
  String get phone => authBox.get(phoneId, defaultValue: '');

  @override
  set phone(String name) => authBox.put(phoneId, name);

  @override
  String get refreshToken => authBox.get(refreshTokenId, defaultValue: '');

  @override
  set refreshToken(String name) => authBox.put(refreshTokenId, name);

  @override
  String get userId => authBox.get(userIdText, defaultValue: '');

  @override
  set userId(String userId) => authBox.put(userIdText, userId);

  @override
  String get fcmToken => authBox.get(fcmTokenId, defaultValue: '');

  @override
  set fcmToken(String fcmToken) => authBox.put(fcmTokenId, fcmToken);

  @override
  int get refreshTokenExpiredDate =>
      authBox.get(refreshTokenExpiredDateId, defaultValue: 0);

  @override
  set refreshTokenExpiredDate(int date) =>
      authBox.put(refreshTokenExpiredDateId, date);

  @override
  int get authTokenExpiredDate =>
      authBox.get(authTokenExpiredDateId, defaultValue: 0);

  @override
  set authTokenExpiredDate(int date) =>
      authBox.put(authTokenExpiredDateId, date);

  @override
  Future<void> clearAuth() async => await authBox.clear();

  static const authBoxID = 'auth_hive_box';
  static const authTokenId = 'authToken';
  static const userIdText = 'userId';
  static const usernameId = 'username';
  static const firstNameId = 'firstName';
  static const lastNameId = 'lastName';
  static const emailId = 'email';
  static const phoneId = 'phone';
  static const refreshTokenId = 'refreshToken';
  static const refreshTokenExpiredDateId = 'refreshTokenExpired';
  static const authTokenExpiredDateId = 'authTokenExpired';
  static const fcmTokenId = 'fcmToken';
}
