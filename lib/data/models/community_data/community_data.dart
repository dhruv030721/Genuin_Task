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

  @HiveField(4)
  final int no_of_videos;

  @HiveField(5)
  final int no_of_groups;

  @HiveField(6)
  final int no_of_members;

  @HiveField(7)
  final String description;

  @HiveField(8)
  final String share_url;

  @HiveField(9)
  final String banner;


  CommunityData({
    required this.name,
    required this.logo,
    required this.handle,
    required this.no_of_videos,
    required this.no_of_groups,
    required this.no_of_members,
    required this.description,
    required this.share_url,
    required this.banner
  });

  factory CommunityData.fromJson(Map<String, dynamic> json) {
    print(json);
    return CommunityData(
      name: json['name'] ?? '',
      logo: json['brand']['logo'] ?? '',
      handle: json['handle'] ?? '',
      no_of_groups: json['no_of_loops'] ?? 0,
      no_of_members: json['no_of_members'] ?? 0,
      no_of_videos: json['no_of_videos'] ?? 0,
      share_url: json['share_url'] ?? '',
      description: json['description'] ?? '',
      banner: json['banner'] ?? ''
    );
  }
}


