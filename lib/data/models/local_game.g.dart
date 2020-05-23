// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalGameAdapter extends TypeAdapter<LocalGame> {
  @override
  final typeId = 1;

  @override
  LocalGame read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalGame(
      players: (fields[0] as List)?.cast<LocalPlayer>(),
      name: fields[1] as String,
      pointsToWin: fields[2] as int,
      numberOfPlayers: fields[3] as int,
      winner: fields[4] as String,
      createdAt: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalGame obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.players)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.pointsToWin)
      ..writeByte(3)
      ..write(obj.numberOfPlayers)
      ..writeByte(4)
      ..write(obj.winner)
      ..writeByte(5)
      ..write(obj.createdAt);
  }
}
