import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/budget_constants.dart';
import 'di.dart' as di;
import 'presentation/bloc/game/game_bloc.dart';
import 'presentation/pages/home_bottom_navigation_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(APP_THEME);

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: const Color(0xff249681),
      ),
    );

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff58C6B2),
        primaryColor: const Color(0xff249681),
        accentColor: const Color(0xff34AB95),
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
        textTheme: Typography(platform: TargetPlatform.iOS).white,
        accentTextTheme: Typography(platform: TargetPlatform.iOS).black,
        errorColor: const Color(0xff00FFF0),
      ),
      home: BlocProvider(
        create: (BuildContext context) => di.sl<GameBloc>(),
        child: HomeBottomNavRoute(),
      ),
    );
  }
}
