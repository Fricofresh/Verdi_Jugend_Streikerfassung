import 'dart:convert';
import 'package:verdi_jugend_streikerfassung/services/sendMessageProxy.dart';

class UserModelProvider {
  static final UserModelProvider _instance = UserModelProvider._internal();

  factory UserModelProvider() => _instance;

  _UserModel _currendUserModel;

  UserModelProvider._internal() {
    if (_currendUserModel == null) {
      _currendUserModel = _UserModel();
    }
  }

  _UserModel getCurrendUser() {
    return _UserModel();
  }

  Future<bool> saveAndResetCurrendUser() async {
    if (!await SendMessageProxy().sendData()) {
      return false;
    }
    _currendUserModel = _UserModel();
    return true;
  }
}

class _UserModel {
  // TODO Model
  bool becomeMember;

  _AccoundDetails accountDetail;

  String childBenefit;

  String company;

  String coPartner;

  String currentSalary;

  _GenerallSalaryData generallSalaryData;

  double lostWorkingHours;

  BigInt membershipNumber;

  _PersonalDetails personalDetails;

  bool strikePay;

  bool wantBecomeMember;

  double workingHours;

  String toJson() {
    String result = jsonEncode(this);
    return result;
  }
}

class _AccoundDetails {
  int id;

  String iban;

  String bic;
}

class _GenerallSalaryData {
  bool isAzubi;

  String ausbildung;

  int ausbildungsjahr;

  String endgeldgruppe;
}

class _PersonalDetails {
  String forename;

  String surname;

  String birthday;

  String email;
}
