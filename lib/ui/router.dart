import 'package:bmi_calculator/constants/routes.dart';
import 'package:bmi_calculator/ui/pages/add_date_page.dart';
import 'package:bmi_calculator/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case home:
      return MaterialPageRoute(
        builder: (context) => AddDatePage(),
      );
      break;
    case onboarding:
      return MaterialPageRoute(
        builder: (context) => OnBoardingPage(),
      );
      break;
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(),
      );
      break;
  }
}
