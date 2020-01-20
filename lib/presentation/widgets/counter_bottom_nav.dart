import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Theme.of(context).accentColor,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}