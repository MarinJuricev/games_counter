import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/presentation/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:game_counter/presentation/feature/onboarding/widget/onboarding_body.dart';
import 'package:game_counter/presentation/feature/onboarding/widget/onboarding_image.dart';
import 'package:game_counter/presentation/feature/onboarding/widget/onboarding_title.dart';
import 'package:game_counter/presentation/home_bottom_navigation_route.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../di.dart' as di;

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => di.sl<OnboardingBloc>(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        buildWhen: (previousState, currentState) {
          return currentState.maybeMap(
            orElse: () => true,
            skipOnboardingState: (_) => false,
          );
        },
        builder: (BuildContext context, OnboardingState state) {
          return state.maybeMap(
            orElse: () => null,
            initialState: (params) {
              BlocProvider.of<OnboardingBloc>(context)
                ..add(OnboardingEvent.started());

              return const Center(child: const CircularProgressIndicator());
            },
            startOnboardingState: (_) => _buildIntroductionScreen(context),
          );
        },
        listenWhen: (previousState, currentState) {
          return currentState.maybeMap(
            orElse: () => false,
            skipOnboardingState: (_) => true,
          );
        },
        listener: (buildContext, state) {
          return state.maybeMap(
            orElse: () => null,
            skipOnboardingState: (_) => _navigateToHome(context),
          );
        },
      ),
    );
  }

  Widget _buildIntroductionScreen(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;

    return IntroductionScreen(
      pages: _buildIntroductionPages(accentColor),
      onDone: () {
        BlocProvider.of<OnboardingBloc>(context)
          ..add(OnboardingEvent.finished());
        _navigateToHome(context);
      },
      onSkip: () {
        BlocProvider.of<OnboardingBloc>(context)
          ..add(OnboardingEvent.finished());
        _navigateToHome(context);
      },
      globalBackgroundColor: Colors.white,
      showSkipButton: true,
      skip: Icon(
        Icons.skip_next,
        color: accentColor,
      ),
      next: Icon(
        Icons.forward,
        color: accentColor,
      ),
      done: Text(
        "Done",
        style: TextStyle(color: accentColor, fontWeight: FontWeight.w600),
      ),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).accentColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }

  List<PageViewModel> _buildIntroductionPages(Color color) {
    return List.of(
      [
        PageViewModel(
          titleWidget: OnboardingTitle(
            title: 'GameCounter',
            textColor: color,
          ),
          bodyWidget: OnboardingBody(
            message:
                'Welcome to GameCounter, a universal counting tool for your favorite board games.',
            textColor: color,
          ),
          image: OnboardingImage(assetPath: 'assets/icon/app_icon.png'),
        ),
        PageViewModel(
          titleWidget: OnboardingTitle(
            title: 'Create Game',
            textColor: color,
          ),
          bodyWidget: OnboardingBody(
            message:
                'You create a game by filling out all the required fields, currently we support only points based games.',
            textColor: color,
          ),
          image:
              OnboardingImage(assetPath: 'assets/images/home_onboarding.png'),
        ),
        PageViewModel(
          titleWidget: OnboardingTitle(
            title: 'Create Player',
            textColor: color,
          ),
          bodyWidget: OnboardingBody(
            message:
                'You create a player by filling out all the required fields.',
            textColor: color,
          ),
          image: OnboardingImage(
              assetPath: 'assets/images/create_player_onboarding.png'),
        ),
        PageViewModel(
          titleWidget: OnboardingTitle(
            title: 'History',
            textColor: color,
          ),
          bodyWidget: OnboardingBody(
              message:
                  'Be sure to checkout the history feature to keep track who\'s really mastered the game!',
              textColor: color),
          image: OnboardingImage(
              assetPath: 'assets/images/history_onboarding.png'),
        ),
        PageViewModel(
          titleWidget: OnboardingTitle(
            title: 'Settings',
            textColor: color,
          ),
          bodyWidget: OnboardingBody(
            message:
                'Check out the settings tab if you want to personalize the app colors!',
            textColor: color,
          ),
          image: OnboardingImage(
              assetPath: 'assets/images/settings_onboarding.png'),
          ),
      ],
    );
  }

  _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeBottomNavRoute()),
    );
  }
}
