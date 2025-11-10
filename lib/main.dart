import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'utils/app_theme.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MindShelterApp());
}

class MindShelterApp extends StatelessWidget {
  const MindShelterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindShelter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
