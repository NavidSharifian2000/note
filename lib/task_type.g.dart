// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class taskTypeAdapter extends TypeAdapter<taskType> {
  @override
  final int typeId = 6;

  @override
  taskType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return taskType(
      title: fields[0] as String,
      Image: fields[1] as String,
      tasktype: fields[2] as Enum,
    );
  }

  @override
  void write(BinaryWriter writer, taskType obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.Image)
      ..writeByte(2)
      ..write(obj.tasktype);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is taskTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
