import 'package:flutter/material.dart';
import 'package:rest_api/screens/post_page.dart';

void main() {
  runApp(const API());
}

class API extends StatelessWidget {
  const API({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Working with API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostsData(),
    );
  }
}
