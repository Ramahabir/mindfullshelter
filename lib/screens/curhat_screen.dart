import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';
import '../data/dummy_data.dart';
import '../models/curhat_post.dart';

class CurhatScreen extends StatefulWidget {
  const CurhatScreen({super.key});

  @override
  State<CurhatScreen> createState() => _CurhatScreenState();
}

class _CurhatScreenState extends State<CurhatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ruang Chat Anonim'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => _showNewPostDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildPostsList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showNewPostDialog(),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.edit),
        label: const Text('Chat Anonim'),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.secondaryGradient,
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
                  '💬 Ruang Chat Anonim',
                  style: AppTextStyles.heading2.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Berbagi cerita tanpa identitas',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const Text('🤗', style: TextStyle(fontSize: 48)),
        ],
      ),
    );
  }

  Widget _buildPostsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: DummyData.curhatPosts.length,
      itemBuilder: (context, index) {
        final post = DummyData.curhatPosts[index];
        return _buildPostCard(post);
      },
    );
  }

  Widget _buildPostCard(CurhatPost post) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: AppColors.primaryGradient,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      post.authorAvatar,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post.authorName,
                            style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                          ),
                          if (post.isAnonymous) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.textLight.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Anonim',
                                style: AppTextStyles.bodySmall.copyWith(fontSize: 10),
                              ),
                            ),
                          ],
                        ],
                      ),
                      Text(
                        _getRelativeTime(post.timestamp),
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  iconSize: 20,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              post.content,
              style: AppTextStyles.bodyMedium.copyWith(height: 1.5),
            ),
            if (post.tags.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: post.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '#$tag',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildActionButton(
                  icon: Icons.favorite_border,
                  label: '${post.likes}',
                  onTap: () {},
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.comment_outlined,
                  label: '${post.comments}',
                  onTap: () => _showComments(post),
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: 'Bagikan',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  void _showNewPostDialog() {
    final TextEditingController controller = TextEditingController();
    bool isAnonymous = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ceritakan Perasaanmu',
                          style: AppTextStyles.heading2,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: controller,
                          maxLines: 8,
                          decoration: const InputDecoration(
                            hintText: 'Tulis ceritamu di sini...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Checkbox(
                              value: isAnonymous,
                              onChanged: (value) {
                                setModalState(() {
                                  isAnonymous = value ?? false;
                                });
                              },
                            ),
                            Text(
                              'Posting sebagai Anonymous',
                              style: AppTextStyles.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('✅ Ceritamu sudah dibagikan!'),
                                    backgroundColor: AppColors.success,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Bagikan Cerita'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showComments(CurhatPost post) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Komentar (${post.comments})',
                style: AppTextStyles.heading3,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(child: Text('👤')),
                    title: Text('Pengguna ${index + 1}'),
                    subtitle: const Text('Semangat ya! Kamu tidak sendiri 💪'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
