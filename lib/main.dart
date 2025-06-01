import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_choice_widget/app_scaffold.dart';
import 'package:multi_choice_widget/app_theme.dart';
import 'package:multi_choice_widget/intro_page.dart';
import 'package:multi_choice_widget/theme_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize theme service
  final themeService = ThemeService();
  await themeService.initialize();
  
  runApp(
    ChangeNotifierProvider.value(
      value: themeService,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current theme mode from the theme service
    final themeService = Provider.of<ThemeService>(context);
    
    // Set system UI overlay style based on theme
    SystemChrome.setSystemUIOverlayStyle(
      themeService.isDarkMode
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
            ),
    );

    return MaterialApp(
      title: 'GymApp',
      debugShowCheckedModeBanner: false,
      themeMode: themeService.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const IntroPage()
      // If you want to skip the intro page and go directly to the app with navbar:
      // home: const AppScaffold()
    );
  }
}


