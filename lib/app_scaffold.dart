import 'package:flutter/material.dart';
import 'package:fitness_pro/bottom_navbar.dart';
import 'package:fitness_pro/home_page.dart';
import 'package:fitness_pro/profile_page.dart';
import 'package:fitness_pro/progress_page.dart';
import 'package:fitness_pro/theme_service.dart';
import 'package:fitness_pro/theme_toggle_button.dart';
import 'package:fitness_pro/workout_selection.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _updatePages();
  }
  
  void _updatePages() {
    _pages = [
      // Home page
      const HomePage(),
      // Workout selection page
      const WorkoutSelectionPage(),
      // Progress page
      const ProgressPage(),
      // Profile page
      const ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }  @override
  Widget build(BuildContext context) {
    // Get theme provider
    final themeService = Provider.of<ThemeService>(context);
    final isDarkMode = themeService.isDarkMode;
    
    // Define colors based on theme
    final backgroundColor = isDarkMode ? const Color(0xFF0A0A0B) : const Color(0xFFFAFAFC);
    final textColor = isDarkMode ? const Color(0xFFE8E8E8) : const Color(0xFF2A2A2A);
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: _currentIndex != 1 ? AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            _getPageTitle(),
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          actions: [
            // Theme toggle button
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ThemeToggleButton(),
            ),
          ],
        ) : null,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  String _getPageTitle() {
    switch (_currentIndex) {
      case 0:
        return 'GymApp';
      case 1:
        return 'Workout Selection';
      case 2:
        return 'Progress';
      case 3:
        return 'Profile';
      default:
        return 'GymApp';
    }
  }
}
