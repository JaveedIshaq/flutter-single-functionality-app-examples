import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class FakeHttpClient {
  Future<String> fakeResponseBody() async {
    await Future.delayed(Duration(milliseconds: 500));
    //! No Internet Connection
    //throw SocketException('No Internet');
    //! 404
    //throw HttpException('404');
    //! invalid JSON (throws format exception)
    return 'abcd';

    return '{"userId":1,"id":1,"title":"nice title","body":"cool body"}';
  }
}

class PostService {
  final httpClient = FakeHttpClient();

  Future<Post> getOnePost() async {
    try {
      final responseBody = await httpClient.fakeResponseBody();
      return Post.fromJson(responseBody);
    } on SocketException {
      throw Failure('No Internet Conectivity 😒');
    } on HttpException {
      throw Failure('Could not fine the Post 😎');
    } on FormatException {
      throw Failure('Bad response format 👎');
    }
  }
}

class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message;
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    @required this.id,
    @required this.userId,
    @required this.title,
    @required this.body,
  });

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
    );
  }

  static Post fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post id: $id, userId: $userId, title: $title, body: $body';
  }
}
