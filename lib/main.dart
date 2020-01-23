import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/pages/home_bottom_navigation_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: const Color(0xff249681)));

    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: const Color(0xff249681),
        accentColor: const Color(0xff34AB95),
        scaffoldBackgroundColor: const Color(0xff58C6B2),
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
        textTheme: Typography(platform: TargetPlatform.iOS).white,
      ),
      home: HomeBottomNavRoute(),
    );
  }
}
