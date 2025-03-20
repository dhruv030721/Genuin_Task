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
  final group = json['group'] as Map<String, dynamic>? ?? {};
  final latestMessages = json['latest_messages'] as List<dynamic>? ?? [];
  
  String lastPostedBy = 'No Posts';
  if (latestMessages.isNotEmpty) {
    final owner = latestMessages[0]['owner'] as Map<String, dynamic>? ?? {};
    lastPostedBy = owner['username'] ?? 'Unknown User';
  }
  
  return GroupData(
    groupName: group['group_name'] ?? 'Unknown Group',
    lastPostedBy: lastPostedBy,
    groupCollaborators: (group['members'] as List<dynamic>? ?? [])
        .map((e) => MemberData.fromJson(e))
        .toList(),
    groupDescription: group['group_description'] ?? 'No Description',
    recentPosts: latestMessages.map((e) => RecentPost.fromJson(e)).toList(),
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
  final owner = json['owner'] as Map<String, dynamic>? ?? {};
  
  return RecentPost(
    messageId: json['message_id'] ?? '',
    postedBy: owner['username'] ?? '',
    thumbnailUrl: json['thumbnail_url'] ?? '',
  );
}
}
