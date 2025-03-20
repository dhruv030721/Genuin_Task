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
      no_of_videos: fields[4] as int,
      no_of_groups: fields[5] as int,
      no_of_members: fields[6] as int,
      description: fields[7] as String,
      share_url: fields[8] as String,
      banner: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.logo)
      ..writeByte(2)
      ..write(obj.handle)
      ..writeByte(4)
      ..write(obj.no_of_videos)
      ..writeByte(5)
      ..write(obj.no_of_groups)
      ..writeByte(6)
      ..write(obj.no_of_members)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.share_url)
      ..writeByte(9)
      ..write(obj.banner);
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
