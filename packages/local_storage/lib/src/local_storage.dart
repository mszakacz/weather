import 'package:shared_preferences/shared_preferences.dart';

/// Flutter package that handles data that should be saved in the device memory
class LocalStorage {
  /// {@macro local_storage}
  const LocalStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  /// Save age restriction as accepted
  Future<void> save(
    String value,
    String key,
  ) async {
    await _sharedPreferences.setString(
      key,
      value,
    );
  }

  /// get data
  String? get(String key) {
    final data = _sharedPreferences.getString(
      key,
    );
    return data;
  }
}
