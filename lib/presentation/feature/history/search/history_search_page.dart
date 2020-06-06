import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart' as di;
import '../../../widgets/error.dart';
import '../../../widgets/info_container.dart';
import 'bloc/history_bloc.dart';
import 'widget/history_list_view.dart';

class HistorySearchDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle:
                TextStyle(color: theme.primaryTextTheme.headline6.color)),
        primaryColor: theme.primaryColor,
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        primaryTextTheme: theme.primaryTextTheme,
        textTheme: theme.textTheme.copyWith(
            headline6: theme.textTheme.headline6
                .copyWith(color: theme.primaryTextTheme.headline6.color)));
  }

  @override
  String get searchFieldLabel => 'Search Previous Games';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: InfoContainer(
                description: 'Search term must be longer than two characters'),
          )
        ],
      );
    }

    return BlocProvider(
      create: (BuildContext context) => di.sl<HistoryBloc>(),
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (BuildContext context, HistoryState state) {
          BlocProvider.of<HistoryBloc>(context)
            ..add(HistoryEvent.queryChanged(query: query));

          return state.map(
            initialState: (params) =>
                Center(child: CircularProgressIndicator()),
            updatedState: (params) => params.historyItems.isEmpty
                ? InfoContainer(
                    description: 'No games for that query!',
                  )
                : HistoryListView(historyItems: params.historyItems),
            errorState: (params) =>
                ErrorContainer(erorrMessage: params.errorMessage),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return SizedBox();
  }
}
