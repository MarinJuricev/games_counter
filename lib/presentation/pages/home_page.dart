import 'package:flutter/material.dart';
import 'package:game_counter/presentation/widgets/counter_bottom_nav.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Test'),
      ),
      bottomNavigationBar: CounterBottomNav(),
    );
  }
}
