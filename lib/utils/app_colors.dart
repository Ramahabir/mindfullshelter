import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Warna Kuat dan Kontras untuk Anak
  static const Color primary = Color(0xFF4A148C); // Deep Purple - Sangat Gelap
  static const Color secondary = Color(0xFFC2185B); // Pink Dark - Lebih gelap
  static const Color accent = Color(0xFFF57C00); // Orange Dark - Lebih gelap
  
  // Background Colors
  static const Color background = Color(0xFFF5F5F5); // Light Gray - Netral
  static const Color cardBackground = Colors.white;
  
  // Mood Colors - Warna Gelap dan Jelas Berbeda
  static const Color moodHappy = Color(0xFFF57F17); // Yellow/Amber Dark
  static const Color moodCalm = Color(0xFF2E7D32); // Green Dark
  static const Color moodSad = Color(0xFF1565C0); // Blue Dark
  static const Color moodAngry = Color(0xFFC62828); // Red Dark
  static const Color moodAnxious = Color(0xFF6A1B9A); // Purple Dark
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Hitam pekat
  static const Color textSecondary = Color(0xFF616161); // Gray gelap
  static const Color textLight = Color(0xFF9E9E9E); // Gray terang
  
  // Semantic Colors - Warna Gelap dan Tegas
  static const Color success = Color(0xFF2E7D32); // Green Dark
  static const Color warning = Color(0xFFE65100); // Orange Dark
  static const Color error = Color(0xFFC62828); // Red Dark
  static const Color info = Color(0xFF1565C0); // Blue Dark
  
  // Gradient Colors - Kontras Tinggi dengan Warna Gelap
  static const List<Color> primaryGradient = [
    Color(0xFF4A148C), // Deep Purple
    Color(0xFF6A1B9A), // Purple Dark
  ];
  
  static const List<Color> secondaryGradient = [
    Color(0xFFC2185B), // Pink Dark
    Color(0xFFD84315), // Deep Orange Dark
  ];
  
  static const List<Color> sunsetGradient = [
    Color(0xFFE65100), // Orange Dark
    Color(0xFFF57F17), // Amber Dark
  ];
}
