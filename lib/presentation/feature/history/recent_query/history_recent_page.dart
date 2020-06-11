import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart' as di;
import '../../../widgets/error.dart';
import '../../../widgets/info_container.dart';
import '../search/history_search_page.dart';
import 'bloc/history_recent_query_bloc.dart';
import 'widget/recent_query_list.dart';

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
        body: BlocProvider(
          create: (BuildContext context) => di.sl<HistoryRecentQueryBloc>(),
          child: BlocBuilder<HistoryRecentQueryBloc, HistoryRecentQueryState>(
              builder: (BuildContext context, HistoryRecentQueryState state) {
            BlocProvider.of<HistoryRecentQueryBloc>(context)
              ..add(HistoryRecentQueryEvent.getRecentQuries());

            return state.map(
              initialState: (params) =>
                  Center(child: CircularProgressIndicator()),
              updatedState: (params) => params.recentQueries.isEmpty
                  ? InfoContainer(description: 'No recent queries!')
                  : RecentQueryList(recentQueries: params.recentQueries),
              errorState: (params) => ErrorContainer(
                erorrMessage:
                    'No recent searches available, please use the search bar at the top!',
              ),
            );
          }),
        ),
      ),
    );
  }
}
