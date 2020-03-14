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
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int _selectedPageIndex = 0;

  void selectPage(int page) {
    setState(() {
      _selectedPageIndex = page;
      _pageController.animateToPage(page,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (page) {
            setState(() => _selectedPageIndex = page);
          },
          children: <Widget>[
            HomePage(),
            HistoryPage(),
            SettingsPage(),
          ],
        ),
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
