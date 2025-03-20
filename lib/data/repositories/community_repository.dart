import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'package:genuin_task/data/models/group_data/group_data.dart';
import 'package:genuin_task/data/models/member_data/member_data.dart';
import 'package:genuin_task/data/models/community_data/community_data.dart';

class CommunityRepository {
  final Dio _dio = Dio();
  final Box _cacheBox = Hive.box('community_cache');

  final String apiUrl =
      'https://nodejs.qa.begenuin.com/api/v3/community?community_id=';
  final String memberApiUrl =
      'https://nodejs.qa.begenuin.com/api/v3/community/members?community_id=';
  final String groupApiUrl =
      'https://nodejs.qa.begenuin.com/api/v3/community/loops?community_id=';

  /// Fetch Community Data with Caching
  Future<CommunityData> fetchCommunityData(String communityId) async {
    String cacheKey = 'community_$communityId';

    // Return cached data if available
    if (_cacheBox.containsKey(cacheKey)) {
      print("Fetching community data from cache...");
      final cachedData = Map<String, dynamic>.from(_cacheBox.get(cacheKey));
      return CommunityData.fromJson(cachedData);
    }

    try {
      Response response = await _dio.get('$apiUrl$communityId');
      if (response.statusCode == 200) {
        dynamic data = response.data['data'];

        // Store in cache
        _cacheBox.put(cacheKey, data);
        return CommunityData.fromJson(data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  /// Fetch Community Members with Caching
  Future<List<MemberData>> fetchCommunityMembers(String communityId) async {
    String cacheKey = 'members_$communityId';

    // Return cached data if available
    if (_cacheBox.containsKey(cacheKey)) {
      print("Fetching members from cache...");
      List<dynamic> cachedData = _cacheBox.get(cacheKey);
      return cachedData
          .map((json) => MemberData.fromJson(Map<String, dynamic>.from(json)))
          .toList();
    }

    try {
      Response response = await _dio.get('$memberApiUrl$communityId');
      if (response.statusCode == 200) {
        List<dynamic> memberList = response.data['data']['members'] ?? [];

        // Store in cache
        _cacheBox.put(cacheKey, memberList);
        return memberList.map((member) => MemberData.fromJson(member)).toList();
      } else {
        throw Exception("Failed to load members");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  /// Fetch Community Groups with Caching
  Future<List<GroupData>> fetchCommunityGroups(String communityId) async {
    String cacheKey = 'groups_$communityId';

    // Return cached data if available
    if (_cacheBox.containsKey(cacheKey)) {
      print("Fetching groups from cache...");
      List<dynamic> cachedData = _cacheBox.get(cacheKey);

      try {
        return cachedData
            .map((json) => GroupData.fromJson(Map<String, dynamic>.from(json)))
            .toList();
      } catch (e) {
        print("Error parsing cached data: $e");
        _cacheBox.delete(cacheKey); // Clear the cache if invalid
      }
    }

    try {
      Response response = await _dio.get('$groupApiUrl$communityId');
      if (response.statusCode == 200) {
        List<dynamic> groupList = response.data['data']['conversations'] ?? [];

        // Convert objects to JSON before storing
        List<Map<String, dynamic>> jsonList =
            groupList.map((group) => group as Map<String, dynamic>).toList();

        _cacheBox.put(cacheKey, jsonList);
        return groupList.map((group) => GroupData.fromJson(group)).toList();
      } else {
        throw Exception("Failed to load groups");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
