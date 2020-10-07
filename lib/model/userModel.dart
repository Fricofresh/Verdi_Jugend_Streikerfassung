import 'dart:convert';
import 'package:verdi_jugend_streikerfassung/services/sendMessageProxy.dart';

class UserModelProvider
{
  static final UserModelProvider _instance = UserModelProvider._internal();

  factory UserModelProvider() => _instance;

  UserModel _currentUserModel;

  UserModelProvider._internal()
  {
    if (_currentUserModel == null)
    {
      _currentUserModel = UserModel();
    }
  }

  UserModel getCurrentUser()
  {
    return _currentUserModel;
  }

  Future<bool> saveAndResetCurrentUser() async
  {
    if (!await SendMessageProxy().sendData())
    {
      return false;
    }
    _currentUserModel = UserModel();
    return true;
  }
}

class UserModel
{
  bool _flgMember;
  bool _flgNumber;
  bool _flgGrossSalary;
  bool _flgKnowSalary;
  bool _flgChildren;
  bool _flgPartner;
  bool _flgAccount;
  
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

  bool get flgMember  => _flgMember;
  bool get flgAccount  => _flgAccount;
  bool get flgMembershipNumber => _flgNumber;
  bool get flgGrossSalary => _flgGrossSalary;
  bool get flgKnowSalary => _flgKnowSalary;
  bool get flgChildren => _flgChildren;
  bool get flgPartner => _flgPartner;
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
  
  set flgMember(bool value)
  {
    _flgMember = value;
  }
  
  set flgAccount(bool value)
  {
    _flgAccount = value;
  }
  
  set flgMembershipNumber(bool value)
  {
    _flgNumber = value;
  }
  
  set flgGrossSalary(bool value)
  {
    _flgGrossSalary = value;
  }
  
  set flgKnowSalary(bool value)
  {
    _flgKnowSalary = value;
  }
  
  set flgChildren(bool value)
  {
    _flgChildren = value;
  }
  
  set flgPartner(bool value)
  {
    _flgPartner = value;
  }
  
  set membershipNumber(String value)
  {
    _membershipNumber = value;
  }
  
  set name(String value)
  {
    _name = value;
  }
  
  set prename(String value)
  {
    _prename = value;
  }
  
  set birthday(String value)
  {
    _birthday = value;
  }
  
  set email(String value)
  {
    _email = value;
  }
  
  set iban(String value)
  {
    _iban = value;
  }
  
  set bic(String value)
  {
    _bic = value;
  }
  
  set children(int value)
  {
    _children = value;
  }

  set strikeDetails(StrikeDetails value)
  {
    _strikeDetails = value;
  }

  set salaryData(SalaryData value)
  {
    _salaryData = value;
  }

  String toJson()
  {
    String result = jsonEncode(this);
    return result;
  }
}
class SalaryData
{
  bool _isApprentice;
  double _grosssalary;
  String _salarygroup;
  int _apprenticeshipyear;

  int get apprenticeshipyear => _apprenticeshipyear;

  set apprenticeshipyear(int value)
  {
    _apprenticeshipyear = value;
  }

  String get salarygroup  => _salarygroup;

  set salarygroup(String value)
  {
    _salarygroup = value;
  }

  double get grosssalary => _grosssalary;

  set grosssalary(double value)
  {
    _grosssalary = value;
  }

  bool get isApprentice => _isApprentice;

  set isApprentice(bool value)
  {
    _isApprentice = value;
  }
}

class StrikeDetails
{
  String _company;
  double _weeklyhours;
  double _striketime;

  double get weeklyhours => _weeklyhours;

  set weeklyhours(double value)
  {
    _weeklyhours = value;
  }

  double get striketime => _striketime;

  set striketime(double value)
  {
    _striketime = value;
  }

  String get company => _company;

  set company(String value)
  {
    _company = value;
  }
}
