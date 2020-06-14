import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/history_recent_query_bloc.dart';

class RecentQueryList extends StatefulWidget {
  final List<String> recentQueries;
  final Function(String) onQueryItemClicked;

  const RecentQueryList({
    Key key,
    this.recentQueries,
    this.onQueryItemClicked,
  }) : super(key: key);

  @override
  _RecentQueryListState createState() => _RecentQueryListState();
}

class _RecentQueryListState extends State<RecentQueryList> {
  @override
  Widget build(BuildContext context) {
    final itemBuilderColor = Theme.of(context).textTheme.bodyText1.color;

    return Container(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16.0),
          const Text(
            'Recent Queries',
            style: TextStyle(
              fontSize: 24.0,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: itemBuilderColor,
                height: 1.0,
              ),
              itemCount: widget.recentQueries.length,
              itemBuilder: (BuildContext context, int index) {
                final currentItem = widget.recentQueries[index];

                return Dismissible(
                  key: Key(currentItem),
                  onDismissed: (direction) {
                    BlocProvider.of<HistoryRecentQueryBloc>(context)
                      ..add(HistoryRecentQueryEvent.recentQueryDeleted(
                          positionToDelete: index));

                    setState(() {
                      widget.recentQueries.removeAt(index);
                    });

                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("$currentItem deleted")));
                  },
                  background: Container(
                    color: Theme.of(context).errorColor,
                  ),
                  child: InkWell(
                    onTap: () => widget.onQueryItemClicked(currentItem),
                    splashColor: Theme.of(context).accentColor,
                    child: ListTile(
                      leading: Icon(
                        Icons.access_time,
                        color: itemBuilderColor,
                      ),
                      title: Text(currentItem),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
