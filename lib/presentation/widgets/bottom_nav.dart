import 'package:flutter/material.dart';

import '../pages/add_players_page.dart';
import '../pages/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch(index){
        case 0: {
          // Navigator.pushNamed(context, HomePage.ROUTE_NAME);
          break;
        }
        case 3: {
          Navigator.pushNamed(context, AddPlayersPage.ROUTE_NAME);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('History'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add),
          title: Text('Players'),
        ),
      ],
      currentIndex: _selectedIndex,
      backgroundColor: Theme.of(context).accentColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Theme.of(context).primaryColor,
      onTap: _onItemTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }
}
