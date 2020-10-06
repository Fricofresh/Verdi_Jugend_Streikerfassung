import 'package:shared_preferences/shared_preferences.dart';
import 'package:verdi_jugend_streikerfassung/util/utils.dart' as utils;
import 'dart:convert';

extension SharedPreferencesUtils on SharedPreferences {
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = Map<String, dynamic>();
    for (String key in getKeys()) {
      result[key] = get(key);
    }
    return result;
  }

  String toJson() {
    var map = toMap();
    String result = jsonEncode(map);
    return result;
  }

  String createKey(String routeId) => utils.createKey(routeId);
}
