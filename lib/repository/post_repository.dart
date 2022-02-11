import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/post_model.dart';

// fetching the the data from api

Future<List<Posts>> getPosts(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  return compute(parsePosts, response.body);
}

List<Posts> parsePosts(responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed.map<Posts>((json) => Posts.fromJson(json)).toList();
}

// deleting the stuff inside the api

Future<void> deletePost(int id) async {
  final response = await http.delete(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('Deleted');
  } else {
    throw Exception('Failed to delete');
  }
}

Future<void> postPost(Posts posts) async {
  print('${posts.toJson()}');
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts//posts/");
  // var result = '';
  var response = await http.put(url, body: posts.toJson());
  print(response.body);
  print(response.statusCode);
}

// put and post are almost looks same because some backend have put method or postbasically same almost i think

Future<void> putPosts(Posts posts) async {
  print('${posts.toJson()}');
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts//posts/");
  // var result = '';
  var response = await http.put(url, body: posts.toJson());
  print(response.body);
  print(response.statusCode);
}
// to patch the stuff that already exists

Future<void> patchPosts(Posts posts) async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts$posts.id');
  // String responseData = '';
  await http.patch(url, body: {
    // body is the stuff that in json data that you wanna change
    "id": (posts.id).toString(),
    'title': (posts.title).toString(),
  }, headers: {
    'AuthrizationKey': 'APIToken'
  }).then((response) {
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    // return responseData = result[''];
  });
}
