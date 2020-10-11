import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
      String rawJsonConfig = await rootBundle.loadString('assets/config.json');
      for (var entry in Map<String, dynamic>.from(json.decode(rawJsonConfig)).entries) {
        if (entry.value is String) {
          _preferences.setString(entry.key, entry.value);
        } else if (entry.value is int) {
          _preferences.setInt(entry.key, entry.value);
        } else if (entry.value is bool) {
          _preferences.setBool(entry.key, entry.value);
        } else {
          throw new ValueKey("Den Parameter $entry ist nicht erlaubt.");
        }
      }
    }
    return _instance;
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    // print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  Future<File> writeToFile({String filePath, String stringToWrite}) async {
    Directory appdoc = await getExternalStorageDirectory();
    File localFile = File(appdoc.path + filePath);
    localFile.writeAsString(stringToWrite, mode: FileMode.append);
    print(localFile.absolute);
    return localFile;
  }
}
