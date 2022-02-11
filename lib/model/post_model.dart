class Posts {
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  late final int userId;
  late final int id;
  late final String title;
  late final String body;

  Posts.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int;
    id = json['id'] as int;
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId.toString();
    data['id'] = id.toString();
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
