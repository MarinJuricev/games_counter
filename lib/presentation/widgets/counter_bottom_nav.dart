import 'package:flutter/material.dart';
import 'package:game_counter/presentation/pages/home_page.dart';

class CounterBottomNav extends StatefulWidget {
  const CounterBottomNav({
    Key key,
  }) : super(key: key);

  @override
  _CounterBottomNavState createState() => _CounterBottomNavState();
}

class _CounterBottomNavState extends State<CounterBottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch(index){
        case 0: {
          Navigator.pushNamed(context, HomePage.ROUTE_NAME);
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
