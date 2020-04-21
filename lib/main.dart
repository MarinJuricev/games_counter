import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/presentation/bloc/color/bloc/color_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'di.dart' as di;
import 'presentation/bloc/game/game_bloc.dart';
import 'presentation/pages/home_bottom_navigation_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<GameBloc>(
          create: (BuildContext context) => di.sl<GameBloc>(),
        ),
        BlocProvider<ColorBloc>(
          create: (BuildContext context) => di.sl<ColorBloc>(),
        )
      ],
      // BlocBuilder<, PlayerDetailState>(
      child: BlocBuilder<ColorBloc, ColorState>(
        builder: (_, state) {
          if (state is ColorInitial) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: state.backGroundColor,
                primaryColor: state.primaryColor,
                accentColor: state.accentColor,
                errorColor: state.errorColor,
                primaryTextTheme:
                    Typography(platform: TargetPlatform.iOS).white,
                textTheme: Typography(platform: TargetPlatform.iOS).white,
                accentTextTheme: Typography(platform: TargetPlatform.iOS).black,
              ),
              home: BlocProvider(
                create: (BuildContext context) => di.sl<GameBloc>(),
                child: HomeBottomNavRoute(),
              ),
            );
          }
        },
      ),
    );
  }
}
