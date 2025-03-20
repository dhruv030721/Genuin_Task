// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupDataAdapter extends TypeAdapter<GroupData> {
  @override
  final int typeId = 0;

  @override
  GroupData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupData(
      groupName: fields[0] as String,
      lastPostedBy: fields[1] as String,
      groupCollaborators: (fields[2] as List).cast<MemberData>(),
      groupDescription: fields[3] as String,
      recentPosts: (fields[4] as List).cast<RecentPost>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.groupName)
      ..writeByte(1)
      ..write(obj.lastPostedBy)
      ..writeByte(2)
      ..write(obj.groupCollaborators)
      ..writeByte(3)
      ..write(obj.groupDescription)
      ..writeByte(4)
      ..write(obj.recentPosts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecentPostAdapter extends TypeAdapter<RecentPost> {
  @override
  final int typeId = 2;

  @override
  RecentPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentPost(
      messageId: fields[0] as String,
      postedBy: fields[1] as String,
      thumbnailUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecentPost obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.messageId)
      ..writeByte(1)
      ..write(obj.postedBy)
      ..writeByte(2)
      ..write(obj.thumbnailUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
