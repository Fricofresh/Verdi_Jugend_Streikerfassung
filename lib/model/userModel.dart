import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:verdi_jugend_streikerfassung/services/sendMessageProxy.dart';

part 'userModel.g.dart';

class UserModelProvider {
  static final UserModelProvider _instance = UserModelProvider._internal();

  factory UserModelProvider() => _instance;

  UserModel _currentUserModel;

  UserModelProvider._internal() {
    if (_currentUserModel == null) {
      _currentUserModel = UserModel();
    }
  }

  UserModel getCurrentUser() {
    return _currentUserModel;
  }

  Future<bool> saveAndResetCurrentUser() async {
    if (!await SendMessageProxy().sendData()) {
      return false;
    }
    _currentUserModel = UserModel();
    return true;
  }

  void resetCurrentUser() {
    _currentUserModel = UserModel();
  }
}

@JsonSerializable(nullable: false)
class UserModel {
  bool _flgMember;
  bool _flgMembershipNumber; // wenn eine Mitgliedsnummer vorhanden ist, dann braucht man doch diesen Flag nicht weil membershipNumber = ist Gewerkschaftsmitglied
  bool _flgKnowSalary; // ähm ok
  bool _flgChildren; // anzahl muss doch gespeichert werden, wenn jememsch Kinder hat, damit erübrigt sich doch dieser Flag
  bool _flgPartner;
  bool _flgStandardAccount;
  bool _flgApprentice;

  String _membershipNumber;
  String _name;
  String _prename;
  String _birthday;
  String _email;
  String _iban;
  String _bic;
  int _children;
  SalaryData _salaryData = new SalaryData();
  StrikeDetails _strikeDetails = new StrikeDetails();

  bool get flgMember => _flgMember;
  bool get flgStandardAccount => _flgStandardAccount;
  bool get flgMembershipNumber => _flgMembershipNumber;
  bool get flgKnowSalary => _flgKnowSalary;
  bool get flgChildren => _flgChildren;
  bool get flgPartner => _flgPartner;
  bool get flgApprentice => _flgApprentice;
  String get membershipNumber => _membershipNumber;
  String get name => _name;
  String get prename => _prename;
  String get birthday => _birthday;
  String get email => _email;
  String get iban => _iban;
  String get bic => _bic;
  int get children => _children;
  SalaryData get salaryData => _salaryData;
  StrikeDetails get strikeDetails => _strikeDetails;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  String toJson() => jsonEncode(_$UserModelToJson(this));

  set flgMember(bool value) {
    _flgMember = value;
  }

  set flgStandardAccount(bool value) {
    _flgStandardAccount = value;
  }

  set flgMembershipNumber(bool value) {
    _flgMembershipNumber = value;
  }

  set flgKnowSalary(bool value) {
    _flgKnowSalary = value;
  }

  set flgChildren(bool value) {
    _flgChildren = value;
  }

  set flgPartner(bool value) {
    _flgPartner = value;
  }

  set flgApprentice(bool value) {
    _flgApprentice = value;
  }

  set membershipNumber(String value) {
    _membershipNumber = value;
  }

  set name(String value) {
    _name = value;
  }

  set prename(String value) {
    _prename = value;
  }

  set birthday(String value) {
    _birthday = value;
  }

  set email(String value) {
    _email = value;
  }

  set iban(String value) {
    _iban = value;
  }

  set bic(String value) {
    _bic = value;
  }

  set children(int value) {
    _children = value;
  }

  set strikeDetails(StrikeDetails value) {
    _strikeDetails = value;
  }

  set salaryData(SalaryData value) {
    _salaryData = value;
  }
}

@JsonSerializable()
class SalaryData {
  bool _isApprentice;
  double _grosssalary;
  String _salarygroup;
  int _apprenticeshipyear;

  SalaryData();

  factory SalaryData.fromJson(Map<String, dynamic> json) => _$SalaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryDataToJson(this);

  int get apprenticeshipyear => _apprenticeshipyear;

  set apprenticeshipyear(int value) {
    _apprenticeshipyear = value;
  }

  String get salarygroup => _salarygroup;

  set salarygroup(String value) {
    _salarygroup = value;
  }

  double get grosssalary => _grosssalary;

  set grosssalary(double value) {
    _grosssalary = value;
  }

  bool get isApprentice => _isApprentice;

  set isApprentice(bool value) {
    _isApprentice = value;
  }
}

@JsonSerializable()
class StrikeDetails {
  String _company;
  double _weeklyhours;
  double _striketime;

  StrikeDetails();

  factory StrikeDetails.fromJson(Map<String, dynamic> json) => _$StrikeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$StrikeDetailsToJson(this);

  double get weeklyhours => _weeklyhours;

  set weeklyhours(double value) {
    _weeklyhours = value;
  }

  double get striketime => _striketime;

  set striketime(double value) {
    _striketime = value;
  }

  String get company => _company;

  set company(String value) {
    _company = value;
  }
}
