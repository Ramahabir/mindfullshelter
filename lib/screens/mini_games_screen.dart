import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';
import '../data/dummy_data.dart';
import '../models/mini_game.dart';

class MiniGamesScreen extends StatelessWidget {
  const MiniGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Games'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildGamesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.sunsetGradient,
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
                  '🧩 Mini Games',
                  style: AppTextStyles.heading2.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Belajar sambil bermain yang menyenangkan',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const Text('🎮', style: TextStyle(fontSize: 48)),
        ],
      ),
    );
  }

  Widget _buildGamesList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: DummyData.miniGames.map((game) {
          return _buildGameCard(context, game);
        }).toList(),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, MiniGame game) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: game.isLocked
            ? null
            : () {
                _showGameDetail(context, game);
              },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: game.isLocked
                            ? [Colors.grey.shade300, Colors.grey.shade400]
                            : AppColors.primaryGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        game.thumbnailUrl,
                        style: TextStyle(
                          fontSize: 40,
                          color: game.isLocked ? Colors.white.withOpacity(0.5) : null,
                        ),
                      ),
                    ),
                  ),
                  if (game.isLocked)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(Icons.lock, color: Colors.white, size: 30),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          game.iconEmoji,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            game.title,
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              color: game.isLocked ? AppColors.textLight : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      game.description,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: game.isLocked ? AppColors.textLight : AppColors.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: game.isLocked
                                ? Colors.grey.shade200
                                : AppColors.success.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            game.category,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: game.isLocked ? AppColors.textLight : AppColors.success,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.access_time, size: 14, color: AppColors.textLight),
                        const SizedBox(width: 4),
                        Text(
                          '${game.estimatedMinutes} menit',
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: game.isLocked ? AppColors.textLight : AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showGameDetail(BuildContext context, MiniGame game) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.primaryGradient,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  game.thumbnailUrl,
                  style: const TextStyle(fontSize: 80),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Text(
                    '${game.iconEmoji} ${game.title}',
                    style: AppTextStyles.heading2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    game.description,
                    style: AppTextStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  _buildGameInfo('Kategori', game.category),
                  const SizedBox(height: 12),
                  _buildGameInfo('Durasi', '${game.estimatedMinutes} menit'),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('🎮 Game "${game.title}" akan segera dimulai!'),
                            backgroundColor: AppColors.success,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.primary,
                      ),
                      child: Text(
                        'Mulai Bermain',
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
