// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberDataAdapter extends TypeAdapter<MemberData> {
  @override
  final int typeId = 0;

  @override
  MemberData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemberData(
      name: fields[0] as String,
      nickname: fields[1] as String,
      bio: fields[3] as String,
      profile_image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MemberData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.nickname)
      ..writeByte(3)
      ..write(obj.bio)
      ..writeByte(4)
      ..write(obj.profile_image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
