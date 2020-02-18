import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:bmi_calculator/ui/shared/fonts.dart';
import 'package:bmi_calculator/ui/size_config.dart';
import 'package:flutter/material.dart';

class PageControllButton extends StatelessWidget {
  final String title;
  final bool isVisible;
  final bool isActivated;

  PageControllButton({
    @required this.title,
    this.isVisible = true,
    this.isActivated = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        width: SizeConfig.widthMultiplier * 18.611 * SizeConfig.textScaleFactor,
        height:
            SizeConfig.heightMultiplier * 5.78125 * SizeConfig.textScaleFactor,
        decoration: BoxDecoration(
          color: isActivated ? AppColors.primaryColor : AppColors.boxBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: isActivated
                ? AppFonts.tinyTextStyleV4
                : AppFonts.tinyTextStyleV3,
          ),
        ),
      ),
    );
  }
}
