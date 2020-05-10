import 'package:flutter/material.dart';

import 'colored_rect.dart';

class PointIndicator extends StatelessWidget {
  final Color pointColor;
  final String pointText;

  const PointIndicator({
    Key key,
    this.pointColor,
    this.pointText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomPaint(
          painter: ColoredRect(pointColor),
        ),
        SizedBox(width: 16.0),
        Text(
          pointText,
          style: Theme.of(context).accentTextTheme.bodyText1.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
        ),
      ],
    );
  }
}