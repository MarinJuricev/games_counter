import 'package:flutter/material.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({
    Key key,
    @required this.gameTitle,
  }) : super(key: key);

  final String gameTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 124),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                gameTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
