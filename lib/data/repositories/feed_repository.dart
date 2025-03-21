import 'package:dio/dio.dart';
import 'package:genuin_task/data/models/feed_data/feed_data.dart';
import 'package:hive/hive.dart';

class FeedRepository {
  final Dio _dio = Dio();
  final String apiUrl = "https://nodejs.qa.begenuin.com/goservices/feed/home";
  final Box _cacheBox = Hive.box('feed_cache');

  Future<List<FeedData>> fetchFeedData(String deviceId) async {
    try {
      if (_cacheBox.containsKey('feed_cache')) {
        // Fetching feed data from cache...
        List<dynamic> cachedData = _cacheBox.get('feed_cache');
        return cachedData.map((json) => FeedData.fromJson(Map<String, dynamic>.from(json))).toList();
      }

      Response response = await _dio.post(apiUrl,data: {}, queryParameters: {
        "device_id": deviceId,
        "type": 1
      });

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['feeds'];
        List<FeedData> feedList =
            data.map((json) => FeedData.fromJson(json)).toList();

        // Store API response in Hive cache
        _cacheBox.put('feed_data', data);

        return feedList;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
