import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Warna Pink untuk VIDA Digital (HIV/AIDS Support)
  static const Color primary = Color(0xFFD81B60); // Pink Dark - Warna Utama
  static const Color secondary = Color(0xFFEC407A); // Pink Medium
  static const Color accent = Color(0xFFFF4081); // Pink Accent
  
  // Background Colors
  static const Color background = Color(0xFFF5F5F5); // Light Gray - Netral
  static const Color cardBackground = Colors.white;
  
  // Mood Colors - Warna Jelas Berbeda untuk Mood Tracker
  static const Color moodHappy = Color(0xFFFFB300); // Amber - Senang
  static const Color moodCalm = Color(0xFF66BB6A); // Green - Tenang
  static const Color moodSad = Color(0xFF42A5F5); // Blue - Sedih
  static const Color moodAngry = Color(0xFFEF5350); // Red - Marah
  static const Color moodAnxious = Color(0xFFAB47BC); // Purple - Cemas
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Hitam pekat
  static const Color textSecondary = Color(0xFF616161); // Gray gelap
  static const Color textLight = Color(0xFF9E9E9E); // Gray terang
  
  // Semantic Colors
  static const Color success = Color(0xFF66BB6A); // Green
  static const Color warning = Color(0xFFFFA726); // Orange
  static const Color error = Color(0xFFEF5350); // Red
  static const Color info = Color(0xFF42A5F5); // Blue
  
  // Gradient Colors - Pink Gradients
  static const List<Color> primaryGradient = [
    Color(0xFFD81B60), // Pink Dark
    Color(0xFFEC407A), // Pink Medium
  ];
  
  static const List<Color> secondaryGradient = [
    Color(0xFFEC407A), // Pink Medium
    Color(0xFFFF4081), // Pink Accent
  ];
  
  static const List<Color> sunsetGradient = [
    Color(0xFFFF4081), // Pink Accent
    Color(0xFFFF80AB), // Pink Light
  ];
}
