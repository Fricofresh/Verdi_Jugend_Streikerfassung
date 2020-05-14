import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

extension SharedPreferencesUtils on SharedPreferences {
  Map<String, dynamic> toMap(SharedPreferences sharedPreferences) {
    Map<String, dynamic> result = Map<String, dynamic>();
    for (String key in sharedPreferences.getKeys()) {
      result[key] = sharedPreferences.get(key);
    }
    return result;
  }

  String toJson(SharedPreferences sharedPreferences) {
    var map = toMap(sharedPreferences);
    String result = jsonEncode(map);
    return result;
  }

  String createKey(String routeId) =>
      routeId.replaceFirst("/", "").replaceAll("/", "_");
}
