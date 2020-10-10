// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel()
    ..flgMember = json['flgMember'] as bool
    ..flgStandardAccount = json['flgStandardAccount'] as bool
    ..flgMembershipNumber = json['flgMembershipNumber'] as bool
    ..flgKnowSalary = json['flgKnowSalary'] as bool
    ..flgChildren = json['flgChildren'] as bool
    ..flgPartner = json['flgPartner'] as bool
    ..flgApprentice = json['flgApprentice'] as bool
    ..membershipNumber = json['membershipNumber'] as String
    ..name = json['name'] as String
    ..prename = json['prename'] as String
    ..birthday = json['birthday'] as String
    ..email = json['email'] as String
    ..iban = json['iban'] as String
    ..bic = json['bic'] as String
    ..children = json['children'] as int
    ..salaryData =
        SalaryData.fromJson(json['salaryData'] as Map<String, dynamic>)
    ..strikeDetails =
        StrikeDetails.fromJson(json['strikeDetails'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'flgMember': instance.flgMember,
      'flgStandardAccount': instance.flgStandardAccount,
      'flgMembershipNumber': instance.flgMembershipNumber,
      'flgKnowSalary': instance.flgKnowSalary,
      'flgChildren': instance.flgChildren,
      'flgPartner': instance.flgPartner,
      'flgApprentice': instance.flgApprentice,
      'membershipNumber': instance.membershipNumber,
      'name': instance.name,
      'prename': instance.prename,
      'birthday': instance.birthday,
      'email': instance.email,
      'iban': instance.iban,
      'bic': instance.bic,
      'children': instance.children,
      'salaryData': instance.salaryData,
      'strikeDetails': instance.strikeDetails,
    };

SalaryData _$SalaryDataFromJson(Map<String, dynamic> json) {
  return SalaryData()
    ..apprenticeshipyear = json['apprenticeshipyear'] as int
    ..salarygroup = json['salarygroup'] as String
    ..grosssalary = (json['grosssalary'] as num)?.toDouble()
    ..isApprentice = json['isApprentice'] as bool;
}

Map<String, dynamic> _$SalaryDataToJson(SalaryData instance) =>
    <String, dynamic>{
      'apprenticeshipyear': instance.apprenticeshipyear,
      'salarygroup': instance.salarygroup,
      'grosssalary': instance.grosssalary,
      'isApprentice': instance.isApprentice,
    };

StrikeDetails _$StrikeDetailsFromJson(Map<String, dynamic> json) {
  return StrikeDetails()
    ..weeklyhours = (json['weeklyhours'] as num)?.toDouble()
    ..striketime = (json['striketime'] as num)?.toDouble()
    ..company = json['company'] as String;
}

Map<String, dynamic> _$StrikeDetailsToJson(StrikeDetails instance) =>
    <String, dynamic>{
      'weeklyhours': instance.weeklyhours,
      'striketime': instance.striketime,
      'company': instance.company,
    };
