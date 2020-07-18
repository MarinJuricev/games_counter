import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/presentation/feature/onboarding/bloc/onboarding_bloc.dart';
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
    return IntroductionScreen(
      pages: _buildIntroductionPages(),
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
      showSkipButton: true,
      skip: const Icon(
        Icons.skip_next,
        color: Colors.white,
      ),
      next: const Icon(
        Icons.forward,
        color: Colors.white,
      ),
      done: const Text(
        "Done",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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

  List<PageViewModel> _buildIntroductionPages() {
    return List.of(
      [
        PageViewModel(
          title: 'GameCounter',
          body:
              'Welcome to GameCounter, a universal counting tool for your favorite board games.',
          image: Center(
            child: Text('Add app icon here'),
          ),
        ),
        PageViewModel(
          title: 'Create Game',
          body:
              'You create a game by filling out all the required fields, currently we support only points based games.',
          image: Center(
            child: Text('Add create game icon here'),
          ),
        ),
        PageViewModel(
          title: 'Create Player',
          body: 'You create a player by filling out all the required fields.',
          image: Center(
            child: Text('Add create player icon here'),
          ),
        ),
        PageViewModel(
          title: 'History',
          body:
              'Be sure to checkout the history feature to keep track who\'s really mastered the game!',
          image: Center(
            child: Text('Add history icon here'),
          ),
        ),
        PageViewModel(
          title: 'Settings',
          body:
              'Check out the settings tab if you want to personalize the app colors!',
          image: Center(
            child: Text('Add settings icon here'),
          ),
        )
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
