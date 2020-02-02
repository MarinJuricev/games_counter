import 'package:flutter/material.dart';

class GameNotCreated extends StatelessWidget {
  const GameNotCreated({
    Key key,
  }) : super(key: key);

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
                  blurRadius: 8, color: Colors.black26, offset: Offset(0, 2))
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
              child: Text(
                'Game isn\'t created yet, click the button to navigate back to home page',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            FlatButton(
              child: Text(
                'Navigate to Home',
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ),
              onPressed: () {
                //TODO actually implement this behaviour
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
