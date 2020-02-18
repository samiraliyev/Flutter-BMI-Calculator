import 'package:bmi_calculator/ui/size_config.dart';
import 'package:bmi_calculator/ui/widgets/value_selector.dart';
import 'package:flutter/material.dart';

class OnBoardingSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top:
            SizeConfig.heightMultiplier * 13.28125 * SizeConfig.textScaleFactor,
      ),
      child: Column(
        children: <Widget>[
          ValueSelector(
            selectorTitle: 'Height',
            values: List.generate(300, (index) => index),
            onItemSelected: (selectedHeight) {},
            selectorSubtitle: 'cm',
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 7.8125,
          ),
          ValueSelector(
            selectorTitle: 'Weight',
            values: List.generate(300, (index) => index),
            onItemSelected: (selectedHeight) {},
            selectorSubtitle: 'kg',
          ),
        ],
      ),
    );
  }
}
