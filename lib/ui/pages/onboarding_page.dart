import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:bmi_calculator/ui/widgets/dots_indicator.dart';
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
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
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
              flex: 2,
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  OnBoardingFirstPage(),
                  OnBoardingSecondPage(),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: DotsIndicator(
                  controller: _pageController,
                  color: AppColors.dotColor,
                  itemCount: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
