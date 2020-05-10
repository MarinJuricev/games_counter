// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_player.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalPlayerAdapter extends TypeAdapter<LocalPlayer> {
  @override
  final typeId = 2;

  @override
  LocalPlayer read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalPlayer(
      name: fields[0] as String,
      points: fields[1] as int,
      bonusPoints: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalPlayer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.points)
      ..writeByte(2)
      ..write(obj.bonusPoints);
  }
}
