import 'package:flutter/material.dart';

import '../../../widgets/info_container.dart';
import '../search/history_search_page.dart';


class HistoryRecentPage extends StatefulWidget {
  HistoryRecentPage({Key key}) : super(key: key);

  @override
  _HistoryRecentPageState createState() => _HistoryRecentPageState();
}

class _HistoryRecentPageState extends State<HistoryRecentPage> {
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
                ),
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
