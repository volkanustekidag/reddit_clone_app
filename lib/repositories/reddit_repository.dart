import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reddit_clone_app/models/reddit_post.dart';

const url = "https://www.reddit.com/r/flutterdev/top.json?count=20";

class RedditRepository {
  final http.Client httpClient;
  RedditRepository({this.httpClient});

  Future<RedditPost> getPosts() async {
    final response = await this.httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final postsJson = jsonDecode(response.body);

      return RedditPost.fromJson(postsJson);
    } else {
      throw ("ERROR");
    }
  }
}
