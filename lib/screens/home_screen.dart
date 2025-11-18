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
                  '💖 VIDA Digital',
                  style: AppTextStyles.heading3.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Platform Edukasi dan Dukungan Mental bagi Penyintas HIV/AIDS',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/vida.jpg',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.favorite,
                      size: 36,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  );
                },
              ),
            ),
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
        'subtitle': 'Musik & Relaksasi',
        'color': const Color(0xFFF8BBD0), // Pink Light
        'route': const AudioMindfulnessScreen(),
      },
      {
        'icon': '💬',
        'title': 'Chat Anonim',
        'subtitle': 'Berbagi Cerita',
        'color': const Color(0xFFE1BEE7), // Purple Light
        'route': const CurhatScreen(),
      },
      {
        'icon': '📱',
        'title': 'Mood Tracker',
        'subtitle': 'Pantau Emosi',
        'color': const Color(0xFFFFF59D), // Yellow Light
        'route': const MoodTrackerScreen(),
      },
      {
        'icon': '🤖',
        'title': 'Teman Hati',
        'subtitle': 'Chatbot 24/7',
        'color': const Color(0xFFC8E6C9), // Green Light
        'route': const ChatbotScreen(),
      },
      {
        'icon': '📚',
        'title': 'Edukasi',
        'subtitle': 'Info HIV/AIDS',
        'color': const Color(0xFFBBDEFB), // Blue Light
        'route': const MiniGamesScreen(),
      },
      {
        'icon': '🫂',
        'title': 'Komunitas',
        'subtitle': 'Support Group',
        'color': const Color(0xFFFFCDD2), // Red Light
        'route': const MoodTrackerScreen(),
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
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 8),
                Text(
                  feature['title'] as String,
                  style: AppTextStyles.heading3.copyWith(fontSize: 13),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  feature['subtitle'] as String,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
