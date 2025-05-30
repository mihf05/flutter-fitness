import 'package:flutter/material.dart';
import 'package:multi_choice_widget/bottom_navbar.dart';
import 'package:multi_choice_widget/home_page.dart';
import 'package:multi_choice_widget/profile_page.dart';
import 'package:multi_choice_widget/progress_page.dart';
import 'package:multi_choice_widget/workout_selection.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;
  bool _isDarkMode = false;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _updatePages();
  }
  
  void _updatePages() {
    _pages = [
      // Home page
      HomePage(isDarkMode: _isDarkMode),
      // Workout selection page
      const WorkoutSelectionPage(),
      // Progress page
      ProgressPage(isDarkMode: _isDarkMode),
      // Profile page
      ProfilePage(isDarkMode: _isDarkMode),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _updatePages();
    });
  }

  Color get backgroundColor => _isDarkMode ? const Color(0xFF0A0A0B) : const Color(0xFFFAFAFC);
  Color get surfaceColor => _isDarkMode ? const Color(0xFF1A1A1D) : Colors.white;
  Color get textColor => _isDarkMode ? const Color(0xFFE8E8E8) : const Color(0xFF2A2A2A);

  @override
  Widget build(BuildContext context) {
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
              child: IconButton(
                icon: Icon(
                  _isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: textColor,
                ),
                onPressed: _toggleTheme,
              ),
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
