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
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {},
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    ),
                    borderOnForeground: true,
                    elevation: 4.0,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Date: ${games[index].createdAt}'),
                                IconButton(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color,
                                    ),
                                    onPressed: null)
                              ],
                            ),
                            Text(
                              'Game Title: ${games[index].name}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                body: Text('Test'),
              )
            ],
          ),
        );
      },
    );
  }
}
