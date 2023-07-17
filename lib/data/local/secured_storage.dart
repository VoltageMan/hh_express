import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hh_express/helpers/extentions.dart';

import 'package:hh_express/models/profile/user/user_model.dart';
import 'package:hh_express/settings/enums.dart';
import 'package:hh_express/settings/globals.dart';

class LocalStorage {
  static final _storage = new FlutterSecureStorage();
  static UserModel? me;

  static Future<void> init() async {
    await _setMyLang();
    await _getMe();
    _langSaver();
  }

  static Future<void> _getMe() async {
    final data = await _storage.read(key: LocalDataKeys.me.name);
    if (data != null) {
      me = UserModel.fromJson(jsonDecode(data));
    }
  }

  static Future<void> saveMe(UserModel user) async {
    final newData = await _storage.write(
        key: LocalDataKeys.me.name, value: jsonEncode(user.toJson()));
    me = user;
  }

  static Future<void> unSaveMe() async {
    me = null;
    await _storage.delete(key: LocalDataKeys.me.name);
  }

  static Future<void> _setMyLang() async {
    final myLang = await _storage.read(key: LocalDataKeys.lang.name);
    '$myLang oldLang'.log();

    if (myLang != null) {
      locale.value = myLang;
    }
  }

  static void _langSaver() async {
    locale.addListener(() async {
      try {
        final newLang = locale.value;
        await _storage.write(key: LocalDataKeys.lang.name, value: newLang);

        '$newLang lang Svaed'.log();
      } catch (e) {
        'SaveLangError'.log();
      }
    });
  }
}
