import 'package:flutter/material.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/presentation/feature/history/widget/history_player_item.dart';

import '../model/history_item.dart';

class HistoryListView extends StatefulWidget {
  final List<HistoryItem> historyItems;

  const HistoryListView({
    this.historyItems,
    Key key,
  }) : super(key: key);

  @override
  _HistoryListViewState createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(84.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black26,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Theme(
          data: Theme.of(context)
              .copyWith(cardColor: Theme.of(context).accentColor),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) =>
                addHistoryToggleEvent(widget.historyItems, index, isExpanded),
            children: widget.historyItems.map<ExpansionPanel>(
              (HistoryItem historyItem) {
                return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Date: ${historyItem.createdAt}'),
                                SizedBox(height: 8.0),
                                Text(
                                  'Game Title: ${historyItem.gameTitle}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 8.0),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Game Title: ',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: historyItem.highlightedGameTitle,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).errorColor,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            historyItem.nonHighlightedGameTitle,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text('Winner: ${historyItem.gameWinner}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    body: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              HistoryPlayerItem(playerData: 'Player Name'),
                              HistoryPlayerItem(playerData: 'Sum'),
                              HistoryPlayerItem(playerData: 'Points'),
                              HistoryPlayerItem(playerData: 'Bonus Points'),
                            ],
                          ),
                        ),
                        Column(
                          children: buildPlayerListTile(
                            historyItem.playersSortedByPoints,
                          ),
                        ),
                      ],
                    ),
                    isExpanded: historyItem.isExpanded);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildPlayerListTile(List<Player> playerList) {
    return playerList
        .map((playerItem) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  HistoryPlayerItem(playerData: playerItem.name),
                  HistoryPlayerItem(
                      playerData: playerItem.sumOfAllPoints.toString()),
                  HistoryPlayerItem(playerData: playerItem.points.toString()),
                  HistoryPlayerItem(
                      playerData: playerItem.bonusPoints.toString()),
                ],
              ),
            ))
        .toList();
  }

  void addHistoryToggleEvent(
      List<HistoryItem> historyItems, int index, bool isExpanded) {
    setState(() {
      historyItems[index] =
          historyItems[index].copyWith(isExpanded: !isExpanded);
    });
  }
}
