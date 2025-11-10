class CurhatPost {
  final String id;
  final String authorName;
  final String authorAvatar;
  final String content;
  final DateTime timestamp;
  final int likes;
  final int comments;
  final bool isAnonymous;
  final List<String> tags;

  CurhatPost({
    required this.id,
    required this.authorName,
    required this.authorAvatar,
    required this.content,
    required this.timestamp,
    this.likes = 0,
    this.comments = 0,
    this.isAnonymous = false,
    this.tags = const [],
  });
}

class CurhatComment {
  final String id;
  final String postId;
  final String authorName;
  final String content;
  final DateTime timestamp;

  CurhatComment({
    required this.id,
    required this.postId,
    required this.authorName,
    required this.content,
    required this.timestamp,
  });
}
