import 'dart:async';

import 'package:bmi_calculator/constants/routes.dart';
import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _startTime() async {
    var duration = new Duration(milliseconds: 1500);
    return new Timer(duration, _navigateToNextPage);
  }

  void _navigateToNextPage() {
    Navigator.of(context).pushReplacementNamed(onboarding);
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: RichText(
          strutStyle: StrutStyle(
            fontSize: 1,
          ),
          text: TextSpan(
            text: 'BMI\n',
            style: Theme.of(context).textTheme.display1,
            children: [
              TextSpan(
                text: 'Calculator',
                style: Theme.of(context).textTheme.body1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
