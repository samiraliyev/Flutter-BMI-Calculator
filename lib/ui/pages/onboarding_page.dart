import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:bmi_calculator/ui/widgets/onboarding_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = PageController(
      viewportFraction: 0.2,
      keepPage: true,
    );

    _scrollController.addListener(() {});
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
            _buildGenderSelector(context),
            _buildAgeSelector(context),
          ],
        ),
      ),
    );
  }

  Widget _numberItem(int number, [bool isSelected = false]) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            fontSize: 14,
            color:
                isSelected ? AppColors.backgroundColor : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildAgeSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 36,
          ),
          child: Text(
            'Age',
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 40,
          child: PageView(
            controller: _scrollController,
            reverse: false,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: List.generate(
              100,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: _numberItem(index),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelector(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 36,
        right: 55,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Gender',
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: <Widget>[
              _genderBox(context),
              Expanded(
                child: SizedBox(),
              ),
              _genderBox(context, true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _genderBox(BuildContext context, [bool isMale = false]) {
    return Expanded(
      flex: 5,
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.boxBackground,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              isMale ? 'assets/male.svg' : 'assets/female.svg',
              width: 70,
              height: 70,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              isMale ? 'male' : 'female',
              style: Theme.of(context).textTheme.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
