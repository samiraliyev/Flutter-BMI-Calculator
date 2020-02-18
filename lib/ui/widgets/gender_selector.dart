import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:bmi_calculator/ui/shared/fonts.dart';
import 'package:bmi_calculator/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.widthMultiplier * 10,
        right: SizeConfig.widthMultiplier * 15.277,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Gender',
            style: AppFonts.normalFontStyleV2,
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
    bool selected = false;
    return Expanded(
      flex: 5,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          margin: EdgeInsets.only(
            bottom: SizeConfig.heightMultiplier * 7.8125,
          ),
          padding: EdgeInsets.symmetric(
              vertical:
                  SizeConfig.heightMultiplier * SizeConfig.textScaleFactor * 2,
              horizontal: SizeConfig.widthMultiplier *
                  SizeConfig.textScaleFactor *
                  6.944),
          decoration: BoxDecoration(
            color: AppColors.boxBackground,
            borderRadius:
                BorderRadius.circular(SizeConfig.widthMultiplier * 7.777),
          ),
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                isMale ? 'assets/male.svg' : 'assets/female.svg',
                width: SizeConfig.widthMultiplier * 19.444,
                height: SizeConfig.heightMultiplier * 10.9375,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5625,
              ),
              Text(
                isMale ? 'male' : 'female',
                style: AppFonts.tinyTextStyleV2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
