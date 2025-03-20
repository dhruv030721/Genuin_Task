import 'package:hive/hive.dart';

part 'feed_data.g.dart';

@HiveType(typeId: 0)
class FeedData extends HiveObject {
  @HiveField(0)
  final String communityName;

  @HiveField(1)
  final String communityLogo;

  @HiveField(2)
  final String loopName;

  @HiveField(3)
  final String loopId;

  @HiveField(4)
  final String ownerName;

  @HiveField(5)
  final String videoUrl;

  @HiveField(6)
  final String thumbnailUrl;

  @HiveField(7)
  final int no_of_views;

  @HiveField(8)
  final int no_of_comments;
  
  @HiveField(9)
  final String communityId;

  @HiveField(10)
  final int no_of_sparks;


  FeedData({
    required this.communityName,
    required this.communityId,
    required this.communityLogo,
    required this.loopName,
    required this.loopId,
    required this.ownerName,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.no_of_views,
    required this.no_of_comments,
    required this.no_of_sparks,
  });

  factory FeedData.fromJson(Map<String, dynamic> json) {
    return FeedData(
      communityName: json['community']['name'] ?? '',
      communityId: json['community']['uuid'] ?? '',
      communityLogo: json['community']['brand']['brand_web_logo'] ?? '',
      loopId: json['loop']['uuid'] ?? '',
      loopName: json['loop']['group_name'] ?? '',
      ownerName: json['owner']['name'] ?? '',
      videoUrl: json['video']['media_url_m3u8'] ?? '',
      thumbnailUrl: json['video']['thumbnail_url'] ?? '',
      no_of_comments: json['video']['no_of_comments'] ?? 0,
      no_of_sparks: json['video']['no_of_sparks'] ?? 0,
      no_of_views: json['video']['no_of_views'] ?? 0,
    );
  }
}


