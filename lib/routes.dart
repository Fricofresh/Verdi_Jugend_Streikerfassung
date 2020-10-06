import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/finishPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/membershipNumberPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/becomeMemberPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/newsletterPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/notificationKontaktPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/personalDetailsPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/thanksForJoiningPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/wantBecomeMember.dart';
import 'package:verdi_jugend_streikerfassung/sites/welcomePage.dart';
import 'package:verdi_jugend_streikerfassung/sites/salaryPromptPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/transferarrangements.dart';

Map<String, Widget Function()> get allRoutes {
  return {
    WelcomePage.routeId: () => WelcomePage(),
    WantBecomeMemberPage.routeId: () => WantBecomeMemberPage(),
    BecomeMemberPage.routeId: () => BecomeMemberPage(),
    NotificationKontaktPage.routeId: () => NotificationKontaktPage(),
    ThanksForJoiningPage.routeId: () => ThanksForJoiningPage(),
    MembershipNumberPage.routeId: () => MembershipNumberPage(),
    PersonalDetailsPage.routeId: () => PersonalDetailsPage(),
    NewsletterPage.routeId: () => NewsletterPage(),
    FinishPage.routeId: () => FinishPage(),
    SalaryPromptPage.routeId: () => SalaryPromptPage(),
    TransferArrangementsPage.routeId: () => TransferArrangementsPage(),
  };
}

RouteFactory generalRoutes() {
  return (settings) {
    if (allRoutes.containsKey(settings.name)) {
      final Map<String, dynamic> args = settings.arguments;
      Function materialBuilder = getBuilder(settings, args);
      var materialPageRoute = MaterialPageRoute(
        builder: materialBuilder,
      );
      return materialPageRoute;
    }
    return null;
  };
}

Function getBuilder(RouteSettings settings, Map<String, dynamic> args) {
  Widget Function() result = allRoutes[settings.name];
  Function materialBuilder = (context) => result();
  if (settings.name == PersonalDetailsPage.routeId) {
    if (args != null && args.isNotEmpty) {
      materialBuilder = (context) => PersonalDetailsPage(args: args);
    }
  }
  return materialBuilder;
}
