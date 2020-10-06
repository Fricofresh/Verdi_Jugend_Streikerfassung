import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/routes.dart';
import 'package:verdi_jugend_streikerfassung/services/localStorageService.dart';
import 'styles.dart';

void main() => runApp(MyApp());

String appTitle = "ver.di Jugend Streikerfassung";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$appTitle',
      theme: appTheme,
      onGenerateRoute: generalRoutes(),
    );
  }
}
