import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../domain/entities/player.dart';

typedef void IntCallback(int val);

class PointPicker extends StatefulWidget {
  final Player currentPlayer;
  final Color color;
  final IntCallback callback;
  final int pointsToWin;
  final bool shouldInvertValues;

  const PointPicker({
    Key key,
    @required this.currentPlayer,
    @required this.color,
    @required this.callback,
    @required this.pointsToWin,
    this.shouldInvertValues = false,
  }) : super(key: key);

  @override
  _PointPickerState createState() => _PointPickerState();
}

class _PointPickerState extends State<PointPicker> {
  int _pointsValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: widget.color),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Theme(
          data: ThemeData(
            accentColor: widget.color,
            textTheme: TextTheme(bodyText1: TextStyle(color: Colors.grey)),
          ),
          child: NumberPicker.integer(
            initialValue: 0,
            minValue: widget.shouldInvertValues ? -widget.pointsToWin : 0,
            maxValue: widget.shouldInvertValues ? 0 : widget.pointsToWin,
            listViewWidth: 60,
            infiniteLoop: true,
            highlightSelectedValue: false,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.5, color: widget.color),
                bottom: BorderSide(width: 1.5, color: widget.color),
              ),
            ),
            onChanged: (newValue) {
              _pointsValue = newValue;
              widget.callback(_pointsValue);
            },
          ),
        ),
      ),
    );
  }
}
