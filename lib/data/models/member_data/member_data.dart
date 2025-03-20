import 'package:hive/hive.dart';

part 'member_data.g.dart';

@HiveType(typeId: 0)
class MemberData extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String nickname;

  @HiveField(3)
  final String bio;

  @HiveField(4)
  final String profile_image;

  MemberData({
    required this.name,
    required this.nickname,
    required this.bio,
    required this.profile_image
  });

  factory MemberData.fromJson(Map<String, dynamic> json) {
    return MemberData(
      name: json['name'] ?? '',
      bio: json['bio'] ?? '',
      nickname: json['nickname'] ?? '',
      profile_image: json['profile_image'] ?? ''
    );
  }
}


