import 'package:flutter/material.dart';

class OutLinedButton extends StatelessWidget {
  final Function onPressedEvent;
  final String title;
  final double width;

  OutLinedButton({Key key, this.onPressedEvent, this.title, this.width})
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
      textColor: Colors.white,
      onPressed: onPressedEvent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.white),
      ),
    );
  }
}
