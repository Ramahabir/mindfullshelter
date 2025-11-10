class Mood {
  final String id;
  final String emoji;
  final String label;
  final String color;

  Mood({
    required this.id,
    required this.emoji,
    required this.label,
    required this.color,
  });
}

class MoodEntry {
  final String id;
  final DateTime date;
  final Mood mood;
  final String? note;

  MoodEntry({
    required this.id,
    required this.date,
    required this.mood,
    this.note,
  });
}
