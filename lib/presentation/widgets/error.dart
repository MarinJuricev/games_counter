import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final erorrMessage;

  const ErrorWidget({Key key, this.erorrMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).accentColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 8, color: Colors.black26, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.error_outline, color: Colors.red),
            SizedBox(height: 16.0),
            Text(erorrMessage),
          ],
        ),
      ),
    );
  }
}
