import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final String erorrMessage;

  const ErrorContainer({Key key, this.erorrMessage}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(height: 16.0),
              Text(erorrMessage),
            ],
          ),
        ),
      ),
    );
  }
}