import 'package:flutter/material.dart';

class OnBoardingTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(36, 77, 55, 40),
      child: RichText(
        text: TextSpan(
          text: 'Welcome\n',
          style: Theme.of(context).textTheme.title,
          children: [
            TextSpan(
              text: 'Please add your information for calculation',
              style: Theme.of(context).textTheme.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
