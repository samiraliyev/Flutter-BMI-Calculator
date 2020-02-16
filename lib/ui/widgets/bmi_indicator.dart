import 'package:flutter/material.dart';

enum TileType {
  UnderWeight,
  Normal,
  OverHeight,
  Obese,
}

class BMIIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildTile(TileType.UnderWeight),
        _buildTile(TileType.Normal),
        _buildTile(TileType.OverHeight),
        _buildTile(TileType.Obese),
      ],
    );
  }

  Widget _buildTile(TileType tileType) {
    Color color;
    BorderRadiusGeometry borderRadiusGeometry = BorderRadius.zero;

    switch (tileType) {
      case TileType.UnderWeight:
        color = Colors.yellow;
        borderRadiusGeometry = BorderRadius.only(
          bottomLeft: Radius.circular(16),
          topLeft: Radius.circular(16),
        );
        break;
      case TileType.Normal:
        color = Colors.green;
        break;
      case TileType.OverHeight:
        color = Colors.redAccent;
        break;
      case TileType.Obese:
        color = Colors.red;
        borderRadiusGeometry = BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        );
        break;
    }

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadiusGeometry,
        ),
        height: 30,
      ),
    );
  }
}
