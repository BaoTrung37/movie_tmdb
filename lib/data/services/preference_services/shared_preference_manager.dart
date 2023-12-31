import 'package:api_base/data/services/preference_services/preference_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesManager {
  SharedPreferencesManager(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  ///Request Token
  Future<void> saveRequestToken({required String token}) async =>
      _sharedPreferences.setString(
        PreferenceKeys.requestToken.name,
        token,
      );

  Future<bool> removeRequestToken() async => _sharedPreferences.remove(
        PreferenceKeys.requestToken.name,
      );

  Future<String?> getRequestToken() async => _sharedPreferences.getString(
        PreferenceKeys.requestToken.name,
      );

  /// Session Id
  Future<void> saveSessionId({required String sessionId}) async =>
      _sharedPreferences.setString(PreferenceKeys.sessionId.name, sessionId);

  Future<bool> removeSessionId() async => _sharedPreferences.remove(
        PreferenceKeys.sessionId.name,
      );

  Future<String?> getSessionId() async => _sharedPreferences.getString(
        PreferenceKeys.sessionId.name,
      );

  /// Guest Session Id
  Future<void> saveGuestSessionId({required String sessionId}) async =>
      _sharedPreferences.setString(
          PreferenceKeys.guestSessionId.name, sessionId);

  Future<bool> removeGuestSessionId() async => _sharedPreferences.remove(
        PreferenceKeys.guestSessionId.name,
      );

  Future<String?> getGuestSessionId() async => _sharedPreferences.getString(
        PreferenceKeys.guestSessionId.name,
      );

  /// Access Token
  Future<void> saveAccessToken({required String sessionId}) async =>
      _sharedPreferences.setString(
          PreferenceKeys.guestSessionId.name, sessionId);

  Future<bool> removeAccessToken() async => _sharedPreferences.remove(
        PreferenceKeys.guestSessionId.name,
      );

  Future<String?> getAccessToken() async => _sharedPreferences.getString(
        PreferenceKeys.guestSessionId.name,
      );

  /// Account Id

  Future<void> saveAccountId({required String sessionId}) async =>
      _sharedPreferences.setString(PreferenceKeys.accountId.name, sessionId);

  Future<bool> removeAccountId() async => _sharedPreferences.remove(
        PreferenceKeys.accountId.name,
      );

  Future<String?> getAccountId() async => _sharedPreferences.getString(
        PreferenceKeys.accountId.name,
      );
}
