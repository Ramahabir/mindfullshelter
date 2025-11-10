import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';
import '../data/dummy_data.dart';
import 'mood_tracker_screen.dart';
import 'audio_mindfulness_screen.dart';
import 'curhat_screen.dart';
import 'chatbot_screen.dart';
import 'mini_games_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildWelcomeCard(),
              const SizedBox(height: 24),
              _buildQuickMoodCheck(context),
              const SizedBox(height: 24),
              Text(
                'Fitur Utama',
                style: AppTextStyles.heading3,
              ),
              const SizedBox(height: 16),
              _buildFeatureGrid(context),
              const SizedBox(height: 24),
              _buildRecentActivity(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, Sahabat! 👋',
              style: AppTextStyles.heading2,
            ),
            Text(
              DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(DateTime.now()),
              style: AppTextStyles.bodyMedium,
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.notifications_outlined,
            color: AppColors.primary,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🌼 MindShelter',
                  style: AppTextStyles.heading3.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rumah Digital untuk Jiwa Bahagia dan Percaya Diri',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            '🏡',
            style: TextStyle(fontSize: 48),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickMoodCheck(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bagaimana perasaanmu hari ini?',
              style: AppTextStyles.heading3.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: DummyData.moods.map((mood) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoodTrackerScreen(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(int.parse('FF${mood.color}', radix: 16)).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          mood.emoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mood.label,
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    final features = [
      {
        'icon': '🎧',
        'title': 'Audio Mindfulness',
        'subtitle': 'Relaksasi & Motivasi',
        'color': const Color.fromARGB(255, 255, 74, 92), // Red Light - Lebih gelap
        'route': const AudioMindfulnessScreen(),
      },
      {
        'icon': '💬',
        'title': 'Ruang Curhat',
        'subtitle': 'Berbagi Cerita',
        'color': const Color.fromARGB(255, 41, 158, 255), // Blue Light - Lebih gelap
        'route': const CurhatScreen(),
      },
      {
        'icon': '📱',
        'title': 'Mood Tracker',
        'subtitle': 'Catat Emosimu',
        'color': const Color.fromARGB(255, 255, 232, 23), // Yellow Light - Lebih gelap
        'route': const MoodTrackerScreen(),
      },
      {
        'icon': '🤖',
        'title': 'Teman Hati',
        'subtitle': 'Chatbot Sahabat',
        'color': const Color.fromARGB(255, 81, 255, 86), // Green Light - Lebih gelap
        'route': const ChatbotScreen(),
      },
      {
        'icon': '🧩',
        'title': 'Mini Games',
        'subtitle': 'Belajar Sambil Main',
        'color': const Color.fromARGB(255, 230, 90, 255), // Purple Light - Lebih gelap
        'route': const MiniGamesScreen(),
      },
      {
        'icon': '📖',
        'title': 'Journal',
        'subtitle': 'Tulis Harimu',
        'color': const Color.fromARGB(255, 255, 38, 114), // Pink Light - Lebih gelap
        'route': const MoodTrackerScreen(), // Akan diganti dengan Journal Screen
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => feature['route'] as Widget,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: feature['color'] as Color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  feature['icon'] as String,
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 12),
                Text(
                  feature['title'] as String,
                  style: AppTextStyles.heading3.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  feature['subtitle'] as String,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white, // ← Ubah warna menjadi putih
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Aktivitas Terakhir',
              style: AppTextStyles.heading3,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Lihat Semua',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...DummyData.moodEntries.take(3).map((entry) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(int.parse('FF${entry.mood.color}', radix: 16)).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  entry.mood.emoji,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              title: Text(
                entry.mood.label,
                style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                entry.note ?? 'Tidak ada catatan',
                style: AppTextStyles.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                _getRelativeTime(entry.date),
                style: AppTextStyles.bodySmall,
              ),
            ),
          );
        }),
      ],
    );
  }

  String _getRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} hari lalu';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} menit lalu';
    } else {
      return 'Baru saja';
    }
  }
}
