import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/locale_keys_enum.dart';

class LocaleManager {
  static LocaleManager? _instance;

  static SharedPreferences? _preferences;

  static Future<LocaleManager> instance() async {
    _preferences = _preferences ?? await SharedPreferences.getInstance();
    _instance = _instance ?? LocaleManager._init();
    return _instance!;
  }

  LocaleManager._init();

  Future<void> clearAll() async {
    await _preferences?.clear();
  }

  Future<void> clearAllSaveFirst() async {
    await _preferences?.clear();
    await setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) =>
      _preferences?.getString(key.toString()) ?? '';

  bool getBoolValue(PreferencesKeys key) =>
      _preferences?.getBool(key.toString()) ?? false;
}
