import '../models/mood.dart';
import '../models/journal.dart';
import '../models/audio_mindfulness.dart';
import '../models/chat_message.dart';
import '../models/curhat_post.dart';
import '../models/mini_game.dart';

class DummyData {
  // Moods
  static final List<Mood> moods = [
    Mood(id: '1', emoji: '😊', label: 'Senang', color: 'FFB300'),
    Mood(id: '2', emoji: '😌', label: 'Tenang', color: '66BB6A'),
    Mood(id: '3', emoji: '😢', label: 'Sedih', color: '42A5F5'),
    Mood(id: '4', emoji: '😠', label: 'Marah', color: 'EF5350'),
    Mood(id: '5', emoji: '😰', label: 'Cemas', color: 'AB47BC'),
  ];

  // Mood Entries
  static final List<MoodEntry> moodEntries = [
    MoodEntry(
      id: '1',
      date: DateTime.now(),
      mood: moods[0],
      note: 'Hari ini aku belajar hal baru yang seru!',
    ),
    MoodEntry(
      id: '2',
      date: DateTime.now().subtract(const Duration(days: 1)),
      mood: moods[1],
      note: 'Bermeditasi pagi ini bikin aku tenang',
    ),
    MoodEntry(
      id: '3',
      date: DateTime.now().subtract(const Duration(days: 2)),
      mood: moods[0],
      note: 'Main game dengan teman-teman sangat menyenangkan!',
    ),
  ];

  // Journals
  static final List<Journal> journals = [
    Journal(
      id: '1',
      title: 'Hari Pertama yang Menyenangkan',
      content: 'Hari ini adalah hari yang spesial. Aku belajar banyak hal baru dan bertemu teman-teman yang baik hati.',
      date: DateTime.now().subtract(const Duration(days: 1)),
      mood: '😊',
      tags: ['senang', 'belajar'],
    ),
    Journal(
      id: '2',
      title: 'Meditasi Pagi',
      content: 'Pagi ini aku mencoba meditasi untuk pertama kalinya. Rasanya sangat menenangkan dan membuatku lebih fokus.',
      date: DateTime.now().subtract(const Duration(days: 3)),
      mood: '😌',
      tags: ['tenang', 'meditasi'],
    ),
  ];

  // Audio Mindfulness
  static final List<AudioMindfulness> audioMindfulness = [
    AudioMindfulness(
      id: '1',
      title: 'Relaksasi Pagi Hari',
      description: 'Mulai hari dengan tenang dan penuh harapan',
      category: 'Relaksasi',
      duration: 300, // 5 menit
      audioUrl: 'assets/audio/relaksasi_pagi.mp3',
      thumbnailUrl: '🌅',
      isFavorite: true,
    ),
    AudioMindfulness(
      id: '2',
      title: 'Musik Menenangkan',
      description: 'Musik instrumental untuk ketenangan pikiran',
      category: 'Relaksasi',
      duration: 420, // 7 menit
      audioUrl: 'assets/audio/musik_tenang.mp3',
      thumbnailUrl: '🎵',
    ),
    AudioMindfulness(
      id: '3',
      title: 'Tidur Nyenyak',
      description: 'Musik untuk membantu tidur lebih berkualitas',
      category: 'Tidur',
      duration: 600, // 10 menit
      audioUrl: 'assets/audio/tidur_nyenyak.mp3',
      thumbnailUrl: '🌙',
    ),
    AudioMindfulness(
      id: '4',
      title: 'Meditasi Penyembuhan',
      description: 'Meditasi untuk inner peace dan penyembuhan',
      category: 'Meditasi',
      duration: 480, // 8 menit
      audioUrl: 'assets/audio/meditasi_penyembuhan.mp3',
      thumbnailUrl: '🧘',
      isFavorite: true,
    ),
    AudioMindfulness(
      id: '5',
      title: 'Bernapas dengan Tenang',
      description: 'Latihan pernapasan untuk menenangkan pikiran',
      category: 'Relaksasi',
      duration: 240, // 4 menit
      audioUrl: 'assets/audio/bernapas_tenang.mp3',
      thumbnailUrl: '🌬️',
    ),
  ];

  // Chat Messages (Chatbot)
  static final List<ChatMessage> chatMessages = [
    ChatMessage(
      id: '1',
      message: 'Halo! Aku Teman Hati. Ada yang bisa aku bantu hari ini? 😊',
      isUser: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  ];

  // Curhat Posts
  static final List<CurhatPost> curhatPosts = [
    CurhatPost(
      id: '1',
      authorName: 'Anonymous',
      authorAvatar: '🎭',
      content: 'Hari ini aku merasa lebih kuat. Dukungan dari teman-teman di sini sangat membantu dalam perjalananku. 💪',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      likes: 12,
      comments: 5,
      tags: ['kuat', 'dukungan'],
      isAnonymous: true,
    ),
    CurhatPost(
      id: '2',
      authorName: 'Anonymous',
      authorAvatar: '🎭',
      content: 'Kadang aku merasa sendirian, tapi setelah bergabung di komunitas ini, aku tahu aku tidak sendiri. Kita semua saling mendukung ❤️',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      likes: 18,
      comments: 8,
      tags: ['komunitas', 'dukungan'],
      isAnonymous: true,
    ),
    CurhatPost(
      id: '3',
      authorName: 'Anonymous',
      authorAvatar: '🎭',
      content: 'Aku belajar bahwa tidak apa-apa untuk meminta bantuan. Konselor dan teman-teman di sini selalu siap mendengarkan 🙏',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      likes: 15,
      comments: 6,
      tags: ['bantuan', 'konseling'],
      isAnonymous: true,
    ),
    CurhatPost(
      id: '4',
      authorName: 'Anonymous',
      authorAvatar: '🎭',
      content: 'Terima kasih untuk semua informasi dan edukasi yang dibagikan di sini. Ini sangat membantu aku memahami kondisiku.',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      likes: 20,
      comments: 10,
      tags: ['edukasi', 'informasi'],
      isAnonymous: true,
    ),
  ];

  // Mini Games (Edukasi HIV/AIDS)
  static final List<MiniGame> miniGames = [
    MiniGame(
      id: '1',
      title: 'Apa itu HIV/AIDS?',
      description: 'Pengenalan dasar tentang HIV dan AIDS',
      category: 'Edukasi Dasar',
      thumbnailUrl: '�',
      iconEmoji: '🧬',
      estimatedMinutes: 5,
    ),
    MiniGame(
      id: '2',
      title: 'Cara Penularan HIV',
      description: 'Memahami bagaimana HIV dapat menular',
      category: 'Pencegahan',
      thumbnailUrl: '�',
      iconEmoji: '⚠️',
      estimatedMinutes: 8,
    ),
    MiniGame(
      id: '3',
      title: 'Hidup Sehat dengan HIV',
      description: 'Tips menjaga kesehatan untuk ODHA',
      category: 'Gaya Hidup',
      thumbnailUrl: '💊',
      iconEmoji: '🏃',
      estimatedMinutes: 10,
    ),
    MiniGame(
      id: '4',
      title: 'Dukungan Psikososial',
      description: 'Pentingnya dukungan mental dan sosial',
      category: 'Mental Health',
      thumbnailUrl: '🤝',
      iconEmoji: '💚',
      estimatedMinutes: 12,
    ),
    MiniGame(
      id: '5',
      title: 'ARV dan Pengobatan',
      description: 'Informasi tentang terapi antiretroviral',
      category: 'Pengobatan',
      thumbnailUrl: '💉',
      iconEmoji: '⚕️',
      estimatedMinutes: 15,
    ),
  ];

  // Bot Responses untuk Chatbot
  static final Map<String, List<String>> botResponses = {
    'sedih': [
      'Aku mengerti kamu sedang merasa sedih. Tidak apa-apa untuk merasa sedih kadang-kadang. Mau cerita lebih lanjut? 💙',
      'Sepertinya kamu sedang tidak baik-baik saja. Ingat, perasaan sedih itu normal dan akan berlalu. Aku di sini untuk mendengarkan 🤗',
    ],
    'senang': [
      'Wah, senang sekali mendengarnya! Apa yang membuat kamu senang hari ini? 😊',
      'Keren! Terus semangat ya! Cerita dong apa yang membuat kamu bahagia! ✨',
    ],
    'takut': [
      'Tidak apa-apa merasa takut. Semua orang pernah merasa takut. Mau coba tarik napas dalam-dalam bersama? 🌬️',
      'Aku ada di sini bersamamu. Ketakutan akan berlalu. Kamu lebih kuat dari yang kamu kira! 💪',
    ],
    'marah': [
      'Sepertinya ada yang membuatmu kesal. Coba tarik napas dalam-dalam dulu ya. Mau cerita apa yang terjadi? 😌',
      'Marah itu wajar, tapi mari kita tenangkan diri dulu. Bagaimana kalau mencoba meditasi sebentar? 🧘',
    ],
    'default': [
      'Cerita lebih lanjut dong, aku siap mendengarkan! 👂',
      'Hmm, menarik! Apa lagi yang ingin kamu ceritakan? 🤔',
      'Aku mengerti. Terus cerita ya, aku mendengarkan dengan seksama 💫',
    ],
  };
}
