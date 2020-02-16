import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
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
