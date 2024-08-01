// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotifyAdapter extends TypeAdapter<Notify> {
  @override
  final int typeId = 1;

  @override
  Notify read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notify(
      title: fields[0] as String,
      date: fields[1] as String,
      info: fields[2] as String,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Notify obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.info)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotifyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
