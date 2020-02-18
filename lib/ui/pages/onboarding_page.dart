import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:bmi_calculator/ui/size_config.dart';
import 'package:bmi_calculator/ui/widgets/dot_indicator.dart';
import 'package:bmi_calculator/ui/widgets/onboarding_first_page.dart';
import 'package:bmi_calculator/ui/widgets/onboarding_second_page.dart';
import 'package:bmi_calculator/ui/widgets/onboarding_top.dart';
import 'package:bmi_calculator/ui/widgets/page_control_button.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OnBoardingTop(),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.heightMultiplier * 7.03125,
                ),
                child: SizedBox(
                  height: SizeConfig.heightMultiplier * 57.8125,
                  child: PageView(
                    controller: _pageController,
                    children: <Widget>[
                      OnBoardingFirstPage(),
                      OnBoardingSecondPage(),
                    ],
                  ),
                ),
              ),
              DotIndicator(
                pageCount: 2,
                pageController: _pageController,
                activeDotColor: AppColors.primaryColor,
                dotColor: AppColors.dotColor,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 8.888,
          vertical: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text('PREVIOUS'),
            ),
            PageControllButton(title: 'NEXT'),
          ],
        ),
      ),
    );
  }
}
