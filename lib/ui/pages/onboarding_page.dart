import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:bmi_calculator/ui/widgets/dot_indicator.dart';
import 'package:bmi_calculator/ui/widgets/onboarding_first_page.dart';
import 'package:bmi_calculator/ui/widgets/onboarding_second_page.dart';
import 'package:bmi_calculator/ui/widgets/onboarding_top.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OnBoardingTop(),
            Expanded(
              flex: 3,
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  OnBoardingFirstPage(),
                  OnBoardingSecondPage(),
                ],
              ),
            ),
            Expanded(
              child: DotIndicator(
                pageCount: 2,
                pageController: _pageController,
                activeDotColor: AppColors.primaryColor,
                dotColor: AppColors.dotColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
