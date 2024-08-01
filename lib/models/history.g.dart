// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 0;

  @override
  History read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return History(
      diagnosis: fields[0] as String,
      generatedText: fields[1] as String,
      date: fields[2] as String,
      symptoms: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.diagnosis)
      ..writeByte(1)
      ..write(obj.generatedText)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.symptoms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
