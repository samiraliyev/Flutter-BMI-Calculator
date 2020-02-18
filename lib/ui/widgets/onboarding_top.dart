import 'package:bmi_calculator/ui/shared/fonts.dart';
import 'package:bmi_calculator/ui/size_config.dart';
import 'package:flutter/material.dart';

class OnBoardingTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        SizeConfig.widthMultiplier * 10,
        SizeConfig.heightMultiplier * 8.28125,
        SizeConfig.widthMultiplier * 15.277,
        0,
      ),
      child: RichText(
        text: TextSpan(
          text: 'Welcome\n',
          style: AppFonts.mediumFontStyleV2,
          children: [
            TextSpan(
              text: 'Please add your information for calculation',
              style: AppFonts.tinyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
