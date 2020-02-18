import 'package:flutter/material.dart';

class DotIndicator extends StatefulWidget {
  DotIndicator({
    @required this.pageCount,
    this.activeDotColor = Colors.blue,
    this.dotColor = Colors.blueGrey,
    this.spacing = 10,
    this.pageController,
    this.size = 10,
  });

  /// count of dots
  final int pageCount;

  /// active dot color
  final Color activeDotColor;

  /// unselected dot color
  final Color dotColor;

  /// space between dots
  final double spacing;

  /// dot size
  final double size;

  /// pageController
  final PageController pageController;

  @override
  _DotIndicatorState createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _dotAnimation;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _dotAnimation =
        Tween<double>(begin: 0.0, end: widget.size).animate(_controller);

    widget.pageController.addListener(() {
      bool isPageChanged = widget.pageController.page.round() != _currentPage;
      if (isPageChanged) {
        setState(() {
          _currentPage = widget.pageController.page.round();
        });
      }
      print('round: ${widget.pageController.page.round()}');
    });

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDotRow();
  }

  Widget _buildDotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.pageCount,
        (index) => _buildDot(index),
      ),
    );
  }

  Widget _buildDot(int index) {
    bool isCurrentPage = index == _currentPage;

    return Container(
      width: _dotAnimation.value * (isCurrentPage ? 2 : 1),
      height: _dotAnimation.value,
      margin: EdgeInsets.only(
        right: widget.spacing,
      ),
      decoration: BoxDecoration(
        color: isCurrentPage ? widget.activeDotColor : widget.dotColor,
        borderRadius: BorderRadius.circular(widget.size),
      ),
    );
  }
}
