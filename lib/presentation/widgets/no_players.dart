import 'package:flutter/material.dart';

class NoPlayers extends StatelessWidget {
  const NoPlayers({
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
                blurRadius: 8,
                color: Colors.black26,
                offset: Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                '¯\\_(ツ)_/¯',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 16),
              const Text(
                'No players created, create one by clicking the + button',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
