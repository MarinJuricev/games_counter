import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import '../bloc/color/bloc/color_bloc.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color _backgroundColor;
  Color _primaryColor;
  Color _accentColor;
  Color _errorColor;

  @override
  Widget build(BuildContext context) {
    _backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    _primaryColor = Theme.of(context).primaryColor;
    _accentColor = Theme.of(context).accentColor;
    _errorColor = Theme.of(context).errorColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: AnimatedContainer(
        color: _backgroundColor,
        duration: Duration(milliseconds: 250),
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              InkWell(
                onTap: () => _buildColorDialog(
                  title: 'BackgroundColor',
                  selectedColor: _backgroundColor,
                  onTapAction: _addOnScaffoldChangeEvent,
                ),
                child: ListTile(
                  title: Text('Background Color'),
                  subtitle: Text('Choose background color of the app'),
                  trailing: CircleColor(
                    circleSize: 26.0,
                    color: _backgroundColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _buildColorDialog(
                  title: 'Primary Color',
                  selectedColor: _primaryColor,
                  onTapAction: _addOnPrimaryChangeEvent,
                ),
                child: ListTile(
                  title: Text('Primary Color'),
                  subtitle: Text('Choose primary color of the app'),
                  trailing: CircleColor(
                    circleSize: 26.0,
                    color: _primaryColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _buildColorDialog(
                  title: 'Accent Color',
                  selectedColor: _accentColor,
                  onTapAction: _addOnAccentChangeEvent,
                ),
                child: ListTile(
                  title: Text('Accent Color'),
                  subtitle: Text('Choose accent color of the app'),
                  trailing: CircleColor(
                    circleSize: 26.0,
                    color: _accentColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _buildColorDialog(
                  title: 'Error Color',
                  selectedColor: _errorColor,
                  onTapAction: _addOnErrorChangeEvent,
                ),
                child: ListTile(
                  title: Text('Error Color'),
                  subtitle: Text('Choose error color of the app'),
                  trailing: CircleColor(
                    circleSize: 26.0,
                    color: _errorColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => BlocProvider.of<ColorBloc>(context)
                  ..add(ColorEvent.onResetAppColors()),
                child: ListTile(
                  title: Text('Reset App Colors'),
                  subtitle: Text('Resets the theme to default'),
                ),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }

  void _addOnScaffoldChangeEvent(Color color) {
    BlocProvider.of<ColorBloc>(context)
      ..add(ColorEvent.onScaffoldColorChange(newScaffoldColor: color));
  }

  void _addOnPrimaryChangeEvent(Color color) {
    BlocProvider.of<ColorBloc>(context)
      ..add(ColorEvent.onPrimaryColorChange(newPrimaryColor: color));
  }

  void _addOnAccentChangeEvent(Color color) {
    BlocProvider.of<ColorBloc>(context)
      ..add(ColorEvent.onAccentColorChange(newAccentColor: color));
  }

  void _addOnErrorChangeEvent(Color color) {
    BlocProvider.of<ColorBloc>(context)
      ..add(ColorEvent.onErrorColorChange(newErrorColor: color));
  }

  void _buildColorDialog({
    String title,
    Color selectedColor,
    Function onTapAction,
  }) {
    _openDialog(
      title,
      MaterialColorPicker(
        allowShades: false,
        selectedColor: selectedColor,
        onMainColorChange: (color) {
          onTapAction(color);
          setState(() => selectedColor = color);
        },
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
              },
            ),
          ],
        );
      },
    );
  }
}
