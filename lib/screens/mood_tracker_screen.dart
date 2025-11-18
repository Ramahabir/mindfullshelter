import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';
import '../data/dummy_data.dart';
import '../models/mood.dart';
import 'package:intl/intl.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  Mood? selectedMood;
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildMoodSelector(),
            const SizedBox(height: 24),
            _buildNoteInput(),
            const SizedBox(height: 24),
            _buildSaveButton(),
            const SizedBox(height: 32),
            _buildMoodHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
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
                  'Bagaimana Perasaanmu?',
                  style: AppTextStyles.heading2.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pantau perkembangan emosimu 📝',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const Text('😊', style: TextStyle(fontSize: 48)),
        ],
      ),
    );
  }

  Widget _buildMoodSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Mood Kamu',
              style: AppTextStyles.heading3.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: DummyData.moods.map((mood) {
                final isSelected = selectedMood?.id == mood.id;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMood = mood;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(int.parse('FF${mood.color}', radix: 16))
                          : Color(int.parse('FF${mood.color}', radix: 16)).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? Color(int.parse('FF${mood.color}', radix: 16))
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          mood.emoji,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          mood.label,
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: isSelected ? Colors.white : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ceritakan Lebih Lanjut',
              style: AppTextStyles.heading3.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _noteController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Apa yang membuatmu merasa seperti ini?',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectedMood != null
            ? () {
                // Show success dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('✅ Berhasil!'),
                    content: const Text('Mood kamu sudah tersimpan. Terima kasih sudah berbagi!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppColors.primary,
        ),
        child: Text(
          'Simpan Mood',
          style: AppTextStyles.button,
        ),
      ),
    );
  }

  Widget _buildMoodHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Riwayat Mood',
          style: AppTextStyles.heading3,
        ),
        const SizedBox(height: 16),
        ...DummyData.moodEntries.map((entry) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(int.parse('FF${entry.mood.color}', radix: 16)).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  entry.mood.emoji,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              title: Text(
                entry.mood.label,
                style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    entry.note ?? 'Tidak ada catatan',
                    style: AppTextStyles.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('dd MMM yyyy, HH:mm', 'id_ID').format(entry.date),
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        }),
      ],
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
}
