// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityDataAdapter extends TypeAdapter<CommunityData> {
  @override
  final int typeId = 0;

  @override
  CommunityData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityData(
      name: fields[0] as String,
      logo: fields[1] as String,
      handle: fields[2] as String,
      bio: fields[3] as String,
      no_of_videos: fields[4] as int,
      no_of_groups: fields[5] as int,
      no_of_members: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.logo)
      ..writeByte(2)
      ..write(obj.handle)
      ..writeByte(3)
      ..write(obj.bio)
      ..writeByte(4)
      ..write(obj.no_of_videos)
      ..writeByte(5)
      ..write(obj.no_of_groups)
      ..writeByte(6)
      ..write(obj.no_of_members);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
