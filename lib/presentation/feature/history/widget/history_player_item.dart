import 'package:flutter/material.dart';

class HistoryPlayerItem extends StatelessWidget {
  final String playerData;

  const HistoryPlayerItem({Key key, this.playerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        playerData,
        textAlign: TextAlign.center,
      ),
    );
  }
}
