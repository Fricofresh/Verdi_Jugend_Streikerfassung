import 'dart:convert';
import 'package:verdi_jugend_streikerfassung/util/utils.dart' as utils;

class SingletonModel {
  static final SingletonModel _instance = SingletonModel._internal();
  Map<String, dynamic> _data;

  factory SingletonModel() => _instance;

  SingletonModel._internal() {
    if (_data == null) {
      _data = new Map<String, dynamic>();
    }
  }

  String toJson() {
    String result = jsonEncode(this);
    return result;
  }

  Map<String, dynamic> getData() => _data;

  void addData(Map<String, dynamic> param) {
    _data.addAll(param);
  }

  void addEntrys(List<MapEntry<String, dynamic>> param) {
    _data.addEntries(param);
  }

  void setData(Map<String, dynamic> param) {
    _data.clear();
    _data.addAll(param);
  }

  void resetData() {
    _data.clear();
  }

  String createKey(String routeId) => utils.createKey(routeId);
}
