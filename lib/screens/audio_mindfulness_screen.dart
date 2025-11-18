import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';
import '../data/dummy_data.dart';
import '../models/audio_mindfulness.dart';

class AudioMindfulnessScreen extends StatefulWidget {
  const AudioMindfulnessScreen({super.key});

  @override
  State<AudioMindfulnessScreen> createState() => _AudioMindfulnessScreenState();
}

class _AudioMindfulnessScreenState extends State<AudioMindfulnessScreen> {
  String selectedCategory = 'Semua';
  final List<String> categories = ['Semua', 'Relaksasi', 'Meditasi', 'Tidur'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Mindfulness'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildCategoryFilter(),
          Expanded(
            child: _buildAudioList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
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
                  '🎧 Audio Mindfulness',
                  style: AppTextStyles.heading2.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Musik relaksasi untuk ketenangan pikiran',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const Text('🎵', style: TextStyle(fontSize: 48)),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  category,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isSelected ? Colors.white : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAudioList() {
    final filteredAudios = selectedCategory == 'Semua'
        ? DummyData.audioMindfulness
        : DummyData.audioMindfulness.where((audio) => audio.category == selectedCategory).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: filteredAudios.length,
      itemBuilder: (context, index) {
        final audio = filteredAudios[index];
        return _buildAudioCard(audio);
      },
    );
  }

  Widget _buildAudioCard(AudioMindfulness audio) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          _showAudioPlayer(audio);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.sunsetGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    audio.thumbnailUrl,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      audio.title,
                      style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      audio.description,
                      style: AppTextStyles.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            audio.category,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.access_time, size: 14, color: AppColors.textLight),
                        const SizedBox(width: 4),
                        Text(
                          audio.durationFormatted,
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                audio.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: audio.isFavorite ? AppColors.secondary : AppColors.textLight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAudioPlayer(AudioMindfulness audio) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _AudioPlayerSheet(audio: audio),
    );
  }
}

class _AudioPlayerSheet extends StatefulWidget {
  final AudioMindfulness audio;

  const _AudioPlayerSheet({required this.audio});

  @override
  State<_AudioPlayerSheet> createState() => _AudioPlayerSheetState();
}

class _AudioPlayerSheetState extends State<_AudioPlayerSheet> {
  bool isPlaying = false;
  double currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
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
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                widget.audio.thumbnailUrl,
                style: const TextStyle(fontSize: 100),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Text(
                  widget.audio.title,
                  style: AppTextStyles.heading2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.audio.description,
                  style: AppTextStyles.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Slider(
                  value: currentPosition,
                  max: widget.audio.duration.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      currentPosition = value;
                    });
                  },
                  activeColor: AppColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(currentPosition.toInt()),
                        style: AppTextStyles.bodySmall,
                      ),
                      Text(
                        widget.audio.durationFormatted,
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      iconSize: 40,
                      onPressed: () {},
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 24),
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        iconSize: 32,
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      iconSize: 40,
                      onPressed: () {},
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }
}
