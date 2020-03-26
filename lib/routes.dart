import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/accountDetailPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/childBenefitPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/coPartnerPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/companyPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/currentSalaryPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/finishPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/generallSalaryDataPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/lostWorkingHoursPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/membershipNumberPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/becomeMemberPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/newsletterPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/notificationKontaktPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/personalDetailsPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/strikePayPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/thanksForJoiningPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/wantBecomeMember.dart';
import 'package:verdi_jugend_streikerfassung/sites/welcomePage.dart';
import 'package:verdi_jugend_streikerfassung/sites/workingHoursPage.dart';

Map<String, Object Function()> get allRoutes {
  return {
    WelcomePage.routeId: () => WelcomePage(),
    WantBecomeMemberPage.routeId: () => WantBecomeMemberPage(),
    BecomeMemberPage.routeId: () => BecomeMemberPage(),
    NotificationKontaktPage.routeId: () => NotificationKontaktPage(),
    ThanksForJoiningPage.routeId: () => ThanksForJoiningPage(),
    MembershipNumberPage.routeId: () => MembershipNumberPage(),
    PersonalDetailsPage.routeId: () => PersonalDetailsPage(),
    CompanyPage.routeId: () => CompanyPage(),
    WorkingHoursPage.routeId: () => WorkingHoursPage(),
    LostWorkingHoursPage.routeId: () => LostWorkingHoursPage(),
    CurrentSalaryPage.routeId: () => CurrentSalaryPage(),
    GenerallSalaryDataPage.routeId: () => GenerallSalaryDataPage(),
    ChildBenefitPage.routeId: () => ChildBenefitPage(),
    CoPartnerPage.routeId: () => CoPartnerPage(),
    StrikePayPage.routeId: () => StrikePayPage(),
    AccountDetailPage.routeId: () => AccountDetailPage(),
    NewsletterPage.routeId: () => NewsletterPage(),
    FinishPage.routeId: () => FinishPage()
  };
}

RouteFactory generalRoutes() {
  return (settings) {
    if (allRoutes.containsKey(settings.name)) {
      final Map<String, dynamic> args = settings.arguments;
      var result = allRoutes[settings.name];
      return MaterialPageRoute(
        builder: (context) => result(),
      );
    }
    return null;
  };
}
