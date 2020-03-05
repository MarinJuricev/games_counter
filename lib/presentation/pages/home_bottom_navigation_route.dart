import 'package:flutter/material.dart';
import 'package:game_counter/presentation/pages/history_page.dart';
import 'package:game_counter/presentation/pages/home_page.dart';
import 'package:game_counter/presentation/pages/settings_page.dart';

class HomeBottomNavRoute extends StatefulWidget {
  HomeBottomNavRoute({Key key}) : super(key: key);

  @override
  _HomeBottomNavRouteState createState() => _HomeBottomNavRouteState();
}

class _HomeBottomNavRouteState extends State<HomeBottomNavRoute> {
  List<Widget> _bottomPages;
  int _selectedPageIndex = 0;

  void selectPage(int page) {
    setState(() => _selectedPageIndex = page);
  }

  @override
  void initState() {
    super.initState();

    _bottomPages = [
      HomePage(),
      HistoryPage(),
      SettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _bottomPages[_selectedPageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(size: 35),
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
