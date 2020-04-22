// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_app_colors.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalAppColorsAdapter extends TypeAdapter<LocalAppColors> {
  @override
  final typeId = 0;

  @override
  LocalAppColors read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalAppColors(
      backGroundColor: fields[0] as String,
      accentColor: fields[1] as String,
      errorColor: fields[2] as String,
      primaryColor: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalAppColors obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.backGroundColor)
      ..writeByte(1)
      ..write(obj.accentColor)
      ..writeByte(2)
      ..write(obj.errorColor)
      ..writeByte(3)
      ..write(obj.primaryColor);
  }
}
