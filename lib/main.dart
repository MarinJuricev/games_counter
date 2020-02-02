import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart' as di;
import 'presentation/bloc/game/game_bloc.dart';
import 'presentation/pages/home_bottom_navigation_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

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
        errorColor: const Color(0xff00FFF0),
      ),
      home: BlocProvider(
        create: (context) => di.sl<GameBloc>(),
        child: HomeBottomNavRoute()),
    );
  }
}
