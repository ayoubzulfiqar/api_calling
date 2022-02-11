import 'package:flutter/material.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class PostsData extends StatelessWidget {
  const PostsData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Working with API'),
      ),
      body: FutureBuilder(
          future: getPosts(http.Client()),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Posts> posts = snapshot.data;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(posts[index].title),
                          ),
                          ListTile(
                            title: const Text(
                              "ID",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("${posts[index].id}"),
                          ),
                          ListTile(
                            title: const Text(
                              "Body",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(posts[index].body),
                          ),
                          ListTile(
                            title: const Text(
                              "User ID",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("${posts[index].userId}"),
                          ),
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Posts posts = Posts(
                                      userId: 2,
                                      id: 3,
                                      title: "title",
                                      body:
                                          'xkbchsdbcjvhdcvsbjgdvudsgadvjcdjJCLDcgJLDGVcgdvl');
                                  putPosts(posts);
                                },
                                child: const Buttons(title: 'put'),
                              ),
                              InkWell(
                                onTap: () async {
                                  Posts posts = Posts(
                                      userId: 2,
                                      id: 3,
                                      title: "title",
                                      body:
                                          'xkbchsdbcjvhdcvsbjgdvudsgadvjcdjJCLDcgJLDGVcgdvl');
                                  postPost(posts);
                                },
                                child: const Buttons(title: 'post'),
                              ),
                              InkWell(
                                onTap: () async {
                                  deletePost(posts[index].id);
                                },
                                child: const Buttons(title: 'del'),
                              ),
                              InkWell(
                                onTap: () async {
                                  patchPosts(posts[index]);
                                },
                                child: const Buttons(title: 'patch'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30)
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
