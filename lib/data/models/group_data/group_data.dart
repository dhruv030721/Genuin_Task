import 'package:hive/hive.dart';
import 'package:genuin_task/data/models/member_data/member_data.dart';

part 'group_data.g.dart';

@HiveType(typeId: 0)
class GroupData {
  @HiveField(0)
  final String groupName;

  @HiveField(1)
  final String lastPostedBy;

  @HiveField(2)
  final List<MemberData> groupCollaborators;

  @HiveField(3)
  final String groupDescription;

  @HiveField(4)
  final List<RecentPost> recentPosts;

  GroupData({
    required this.groupName,
    required this.lastPostedBy,
    required this.groupCollaborators,
    required this.groupDescription,
    required this.recentPosts,
  });

  static List<GroupData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => GroupData.fromJson(json)).toList();
  }

  factory GroupData.fromJson(Map<String, dynamic> json) {
    return GroupData(
      groupName: json['group']['group_name'] ?? '',
      lastPostedBy: json['latest_messages'][0]['owner']['username']
          ?? '',
      groupCollaborators: (json['group']['members'] as List)
          .map((e) => MemberData.fromJson(e))
          .toList(),
      groupDescription: json['group']['group_description'] ?? '',
      recentPosts: (json['latest_messages'] as List)
          .map((e) => RecentPost.fromJson(e))
          .toList(),
    );
  }
}

@HiveType(typeId: 2)
class RecentPost {
  @HiveField(0)
  final String messageId;

  @HiveField(1)
  final String postedBy;

  @HiveField(2)
  final String thumbnailUrl;

  RecentPost({
    required this.messageId,
    required this.postedBy,
    required this.thumbnailUrl,
  });

  factory RecentPost.fromJson(Map<String, dynamic> json) {
    return RecentPost(
      messageId: json['message_id'] ?? '',
      postedBy: json['owner']['username'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
    );
  }
}
