import 'package:bmi_calculator/ui/shared/colors.dart';
import 'package:bmi_calculator/ui/shared/fonts.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class ValueSelector extends StatefulWidget {
  final String selectorTitle;
  final List<int> values;
  final Color selectorColor;
  final Function(int) onItemSelected;

  ValueSelector({
    @required this.selectorTitle,
    @required this.values,
    @required this.onItemSelected,
    this.selectorColor,
  });

  @override
  _ValueSelectorState createState() => _ValueSelectorState();
}

class _ValueSelectorState extends State<ValueSelector> {
  PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.25,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.widthMultiplier * 10,
          ),
          child: Text(
            widget.selectorTitle,
            style: AppFonts.normalFontStyleV2,
          ),
        ),
        Container(
          height: SizeConfig.heightMultiplier * 5 * SizeConfig.textScaleFactor,
          margin: EdgeInsets.only(
            bottom: SizeConfig.heightMultiplier * 1.5625,
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: (_) {
              setState(() {
                _currentPage = _pageController.page;
              });
              return true;
            },
            child: PageView.builder(
              reverse: false,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == _currentPage.toInt()) {
                  widget.onItemSelected(_currentPage.toInt());
                }

                return _numberItem(widget.values[index],
                    index == _currentPage.toInt() ? true : false);
              },
              itemCount: widget.values.length,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: SizeConfig.widthMultiplier * 10,
          ),
          width: double.infinity,
          height: SizeConfig.heightMultiplier * 0.78125,
          color: AppColors.accentColor,
        ),
      ],
    );
  }

  Widget _numberItem(int number, [bool isSelected = false]) {
    return Container(
      width: SizeConfig.widthMultiplier * 11.94444 * SizeConfig.textScaleFactor,
      height:
          SizeConfig.heightMultiplier * 3.90625 * SizeConfig.textScaleFactor,
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? widget.selectorColor ?? AppColors.primaryColor
            : AppColors.backgroundColor,
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
}
