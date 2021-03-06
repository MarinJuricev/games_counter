import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/presentation/feature/onboarding/onboarding_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/extensions/extensions.dart';
import 'data/models/local_app_colors.dart';
import 'data/models/local_game.dart';
import 'data/models/local_player.dart';
import 'di.dart' as di;
import 'domain/entities/app_colors.dart';
import 'presentation/feature/core/game_bloc.dart';
import 'presentation/feature/settings/color/color_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<LocalAppColors>(LocalAppColorsAdapter());
  Hive.registerAdapter<LocalGame>(LocalGameAdapter());
  Hive.registerAdapter<LocalPlayer>(LocalPlayerAdapter());

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
      child: BlocBuilder<ColorBloc, ColorState>(
        builder: (builderContext, state) {
          return state.when(
            initialState: () => _buildProgressBar(builderContext),
            updatedState: (appColors) => _buildApp(appColors),
          );
        },
      ),
    );
  }

  Widget _buildApp(AppColors appColors) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor.fromHex(appColors.backGroundColor),
        primaryColor: HexColor.fromHex(appColors.primaryColor),
        accentColor: HexColor.fromHex(appColors.accentColor),
        errorColor: HexColor.fromHex(appColors.errorColor),
        primaryTextTheme:
            Typography.material2018(platform: TargetPlatform.iOS).white,
        textTheme: Typography.material2018(platform: TargetPlatform.iOS).white,
        accentTextTheme:
            Typography.material2018(platform: TargetPlatform.iOS).black,
      ),
      home: BlocProvider(
        create: (BuildContext context) => di.sl<GameBloc>(),
        child: OnboardingPage(),
      ),
    );
  }

  Widget _buildProgressBar(BuildContext builderContext) {
    BlocProvider.of<ColorBloc>(builderContext)
      ..add(ColorEvent.onGetCurrentAppColors());
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
