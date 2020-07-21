import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String assetPath;

  const OnboardingImage({Key key, @required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(assetPath),
        ),
    );
  }
}
