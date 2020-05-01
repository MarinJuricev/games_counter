import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/data/models/local_app_colors.dart';
import 'package:game_counter/domain/entities/app_colors.dart';
import 'package:game_counter/presentation/bloc/color/bloc/color_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/extensions/extensions.dart';
import 'di.dart' as di;
import 'presentation/bloc/game/game_bloc.dart';
import 'presentation/pages/home_bottom_navigation_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<LocalAppColors>(LocalAppColorsAdapter());

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        builder: (builderContext, state) {
          if (state is ColorInitial) {
            BlocProvider.of<ColorBloc>(builderContext)
              ..add(ColorEvent.onGetCurrentAppColors());
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (state is ColorUpdated) {
            return buildApp(state.appColors);
          }
        },
      ),
    );
  }

  Widget buildApp(AppColors appColors) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor.fromHex(appColors.backGroundColor),
        primaryColor: HexColor.fromHex(appColors.primaryColor),
        accentColor: HexColor.fromHex(appColors.accentColor),
        errorColor: HexColor.fromHex(appColors.errorColor),
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
        textTheme: Typography(platform: TargetPlatform.iOS).white,
        accentTextTheme: Typography(platform: TargetPlatform.iOS).black,
      ),
      home: BlocProvider(
        create: (BuildContext context) => di.sl<GameBloc>(),
        child: HomeBottomNavRoute(),
      ),
    );
  }
}
