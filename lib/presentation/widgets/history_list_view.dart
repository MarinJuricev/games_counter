import 'package:flutter/material.dart';

import '../feature/history/model/history_item.dart';

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
    return ListView.builder(
      itemCount: widget.historyItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
              children: [
                ExpansionPanel(
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
                                Text(
                                    'Date: ${widget.historyItems[index].createdAt}'),
                                SizedBox(height: 8.0),
                                Text(
                                  'Game Title: ${widget.historyItems[index].gameTitle}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                    'Winner: ${widget.historyItems[index].gameWinner}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    //TODO Extract into indepndent widget
                    body: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('PlayerName'),
                              Text('Sum'),
                              Text('Points'),
                              Text('Bonus Points'),
                            ],
                          ),
                        ),
                        Column(
                          children: buildPlayerListTile(index),
                        ),
                      ],
                    ),
                    isExpanded: widget.historyItems[index].isExpanded)
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildPlayerListTile(int index) {
    return widget.historyItems[index].playersSortedByPoints
        .map((playerItem) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(playerItem.name),
                  Text(playerItem.sumOfAllPoints.toString()),
                  Text(playerItem.points.toString()),
                  Text(playerItem.bonusPoints.toString()),
                ],
              ),
            ))
        .toList();
  }

  void addHistoryToggleEvent(
      List<HistoryItem> historyItems, int index, bool isExpanded) {
    historyItems[index] = historyItems[index].copyWith(isExpanded: !isExpanded);

    setState(() {});
  }
}
