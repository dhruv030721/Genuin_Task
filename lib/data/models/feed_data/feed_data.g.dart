// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedDataAdapter extends TypeAdapter<FeedData> {
  @override
  final int typeId = 0;

  @override
  FeedData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedData(
      communityName: fields[0] as String,
      communityId: fields[9] as String,
      communityLogo: fields[1] as String,
      loopName: fields[2] as String,
      loopId: fields[3] as String,
      ownerName: fields[4] as String,
      videoUrl: fields[5] as String,
      thumbnailUrl: fields[6] as String,
      no_of_views: fields[7] as int,
      no_of_comments: fields[8] as int,
      no_of_sparks: fields[10] as int,
      profile_image: fields[11] as String,
      share_url: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeedData obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.communityName)
      ..writeByte(1)
      ..write(obj.communityLogo)
      ..writeByte(2)
      ..write(obj.loopName)
      ..writeByte(3)
      ..write(obj.loopId)
      ..writeByte(4)
      ..write(obj.ownerName)
      ..writeByte(5)
      ..write(obj.videoUrl)
      ..writeByte(6)
      ..write(obj.thumbnailUrl)
      ..writeByte(7)
      ..write(obj.no_of_views)
      ..writeByte(8)
      ..write(obj.no_of_comments)
      ..writeByte(9)
      ..write(obj.communityId)
      ..writeByte(10)
      ..write(obj.no_of_sparks)
      ..writeByte(11)
      ..write(obj.profile_image)
      ..writeByte(12)
      ..write(obj.share_url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
