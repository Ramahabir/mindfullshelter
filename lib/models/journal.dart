class Journal {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final String mood;
  final List<String> tags;

  Journal({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.mood,
    this.tags = const [],
  });
}
