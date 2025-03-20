import 'package:genuin_task/data/models/member_data/member_data.dart';
import 'package:hive/hive.dart';

part 'community_data.g.dart';

@HiveType(typeId: 0)
class CommunityData extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String logo;

  @HiveField(2)
  final String handle;

  @HiveField(3)
  final String bio;

  @HiveField(4)
  final int no_of_videos;

  @HiveField(5)
  final int no_of_groups;

  @HiveField(6)
  final int no_of_members;

  CommunityData({
    required this.name,
    required this.logo,
    required this.handle,
    required this.bio,
    required this.no_of_videos,
    required this.no_of_groups,
    required this.no_of_members,
  });

  factory CommunityData.fromJson(Map<String, dynamic> json) {
    print(json);
    return CommunityData(
      name: json['name'] ?? '',
      logo: json['community_id'] ?? '',
      handle: json['handle'] ?? '',
      bio: 'Hello Guys!',
      no_of_groups: json['no_of_loops'] ?? 0,
      no_of_members: json['no_of_members'] ?? 0,
      no_of_videos: json['no_of_videos'] ?? 0,
    );
  }
}


