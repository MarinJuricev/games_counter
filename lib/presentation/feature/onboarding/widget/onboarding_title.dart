import 'package:flutter/material.dart';

class OnboardingTitle extends StatelessWidget {
  final String title;
  final Color textColor;

  const OnboardingTitle({
    Key key,
    @required this.title,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
