import 'package:flutter/material.dart';

class RecentQueryList extends StatelessWidget {
  final List<String> recentQueries;

  const RecentQueryList({Key key, this.recentQueries}) : super(key: key);

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
              separatorBuilder: (context, index) =>
                  Divider(color: itemBuilderColor),
              itemCount: recentQueries.length,
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () => {},
                splashColor: Theme.of(context).accentColor,
                child: ListTile(
                  leading: Icon(
                    Icons.access_time,
                    color: itemBuilderColor,
                  ),
                  title: Text(recentQueries[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
