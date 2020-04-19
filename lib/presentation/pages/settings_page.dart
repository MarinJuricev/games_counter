import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ColorSwatch _tempMainColor;
  ColorSwatch _mainColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _mainColor,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
          children: ListTile.divideTiles(
        context: context,
        tiles: [
          InkWell(
            onTap: _openBackgroundColorDialog,
            child: ListTile(
              title: Text('Background Color'),
              subtitle: Text('Choose background color of the app'),
              trailing: CircleColor(
                circleSize: 26.0,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Primary Color'),
              subtitle: Text('Choose primary color of the app'),
              trailing: CircleColor(
                circleSize: 26.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Accent Color'),
              subtitle: Text('Choose accent color of the app'),
              trailing: CircleColor(
                circleSize: 26.0,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Error Color'),
              subtitle: Text('Choose error color of the app'),
              trailing: CircleColor(
                  circleSize: 26.0, color: Theme.of(context).errorColor),
            ),
          )
        ],
      ).toList()),
    );
  }

  void _openBackgroundColorDialog() {
    _openDialog(
      'Background Color',
      MaterialColorPicker(
        selectedColor: _mainColor,
        onColorChange: (color) => setState(() => _mainColor = color),
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
        onBack: () => print("Back button pressed"),
      ),
    );
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          content: Container(height: 250, child: content),
          actions: [
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: const Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
              },
            ),
          ],
        );
      },
    );
  }
}
