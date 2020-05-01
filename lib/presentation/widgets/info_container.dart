import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String description;

  const InfoContainer({
    Key key,
    this.title,
    @required this.description,
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
                blurRadius: 8, color: Colors.black26, offset: Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title ?? '¯\\_(ツ)_/¯',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 16),
              Text(
                description,
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
