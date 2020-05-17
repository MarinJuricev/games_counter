import 'package:flutter/material.dart';

import '../../domain/entities/game.dart';

class HistoryListView extends StatelessWidget {
  final List<Game> games;

  const HistoryListView({
    this.games,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).accentColor,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
            borderOnForeground: true,
            elevation: 4.0,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ListTile(
              title: Text(
                games[index].name,
              ),
              subtitle: Text(
                games[index].winner,
              ),
            ),
          ),
        );
      },
    );
  }
}
