class MiniGame {
  final String id;
  final String title;
  final String description;
  final String category;
  final String thumbnailUrl;
  final String iconEmoji;
  final int estimatedMinutes;
  final bool isLocked;

  MiniGame({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnailUrl,
    required this.iconEmoji,
    required this.estimatedMinutes,
    this.isLocked = false,
  });
}
