import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  final String message;
  final Color textColor;

  const OnboardingBody({
    Key key,
    @required this.message,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
