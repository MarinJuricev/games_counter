import 'package:flutter/material.dart';

class OutLinedButton extends StatelessWidget {
  final Function onPressedEvent;
  final String title;
  final double width;
  final Color backgroundColor;

  OutLinedButton(
      {Key key,
      this.onPressedEvent,
      this.title,
      this.width,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(
        horizontal: width != null ? width : 24.0,
        vertical: 8.0,
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 12.0),
      ),
      textColor: backgroundColor,
      onPressed: onPressedEvent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: backgroundColor),
      ),
    );
  }
}
