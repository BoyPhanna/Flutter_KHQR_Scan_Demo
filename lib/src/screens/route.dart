import 'package:flutter/material.dart';
import 'package:qr_bangking_ap/src/screens/caseOut/caseOut.dart';
import 'package:qr_bangking_ap/src/screens/conferm/conferm.dart';
import 'package:qr_bangking_ap/src/screens/home/home_screen.dart';

class AppRoute {
  static const home = 'home';
  static const conferm = 'conferm';
  static const caseOut = 'caseOut';
  static get all => <String, WidgetBuilder>{
        home: (context) => const HomeScreen(),
        conferm: (context) => const ConferScreen(),
        caseOut: (context) => const CaseOut(),
      };
}
