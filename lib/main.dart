import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'utils/app_theme.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Initialize date formatting with error handling
  try {
    await initializeDateFormatting('id_ID', null);
  } catch (e) {
    debugPrint('Error initializing date formatting: $e');
  }
  
  // Run app with error handling
  runApp(const MindShelterApp());
}

class MindShelterApp extends StatelessWidget {
  const MindShelterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIDA Digital',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
