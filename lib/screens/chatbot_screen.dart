import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';
import '../data/dummy_data.dart';
import '../models/chat_message.dart';
import 'package:intl/intl.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = List.from(DummyData.chatMessages);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.primaryGradient,
                ),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text('🤖', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Teman Hati',
                  style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Online',
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.success),
                ),
              ],
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          _buildWelcomeCard(),
          Expanded(
            child: _buildMessagesList(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.info.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.info.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Text('💡', style: TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Aku di sini untuk mendengarkan dan membantumu merasa lebih baik',
              style: AppTextStyles.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: message.isUser ? AppColors.primary : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(message.isUser ? 16 : 4),
            bottomRight: Radius.circular(message.isUser ? 4 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: message.isUser ? Colors.white : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat('HH:mm').format(message.timestamp),
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 10,
                color: message.isUser ? Colors.white.withOpacity(0.7) : AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Ketik pesanmu...',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
              ),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: _sendMessage,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: _messageController.text.trim(),
      isUser: true,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(userMessage);
    });

    _messageController.clear();

    // Simulate bot response
    Future.delayed(const Duration(seconds: 1), () {
      final botResponse = _generateBotResponse(userMessage.message);
      setState(() {
        _messages.add(botResponse);
      });

      // Scroll to bottom
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
  }

  ChatMessage _generateBotResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();
    List<String> responses = DummyData.botResponses['default']!;

    // Check for keywords
    if (lowerMessage.contains('sedih') || lowerMessage.contains('bete')) {
      responses = DummyData.botResponses['sedih']!;
    } else if (lowerMessage.contains('senang') || lowerMessage.contains('bahagia')) {
      responses = DummyData.botResponses['senang']!;
    } else if (lowerMessage.contains('takut') || lowerMessage.contains('khawatir')) {
      responses = DummyData.botResponses['takut']!;
    } else if (lowerMessage.contains('marah') || lowerMessage.contains('kesal')) {
      responses = DummyData.botResponses['marah']!;
    }

    final randomResponse = responses[DateTime.now().millisecond % responses.length];

    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: randomResponse,
      isUser: false,
      timestamp: DateTime.now(),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
