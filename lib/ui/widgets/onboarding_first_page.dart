import 'package:bmi_calculator/ui/widgets/gender_selector.dart';
import 'package:bmi_calculator/ui/widgets/value_selector.dart';
import 'package:flutter/material.dart';

class OnBoardingFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GenderSelector(),
        ValueSelector(
          selectorTitle: 'Age',
          values: List.generate(100, (index) => index),
          onItemSelected: (selectedItem) {
            print('selectedItem: $selectedItem');
          },
        ),
      ],
    );
  }
}
