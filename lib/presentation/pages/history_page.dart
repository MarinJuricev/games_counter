import 'package:flutter/material.dart';
import 'package:game_counter/presentation/widgets/info_container.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 100.0,
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Search previous games'),
              ),
              pinned: true,
              floating: true,
              snap: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                        context: context, delegate: HistorySearchDelegate());
                  },
                )
              ],
            ),
          ];
        },
        body: InfoContainer(
            description:
                'No recent searches available, please use the search bar at the top!'),
      ),
    );
  }
}

class HistorySearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

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
            child: Text('Search term must be longer than two characters'),
          )
        ],
      );
    }

    //TODO Publish to bloc the query and search the local peristence for that query
    return Center(
      child: Text(
        query,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Text(
      'test?',
      style: TextStyle(color: Colors.red),
    );
  }
}
