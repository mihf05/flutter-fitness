import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService with ChangeNotifier {
  // Key for storing theme preference in SharedPreferences
  static const THEME_KEY = "theme_key";

  // Singleton instance
  static final ThemeService _instance = ThemeService._internal();
  
  factory ThemeService() => _instance;
  
  ThemeService._internal();

  // Theme mode with default as system
  ThemeMode _themeMode = ThemeMode.system;
  
  ThemeMode get themeMode => _themeMode;

  // Get current theme mode
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // Initialize theme service by loading preference
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(THEME_KEY);
    
    if (savedTheme == 'dark') {
      _themeMode = ThemeMode.dark;
    } else if (savedTheme == 'light') {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }
    
    notifyListeners();
  }

  // Toggle between light and dark theme
  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      await _saveThemePreference('dark');
    } else {
      _themeMode = ThemeMode.light;
      await _saveThemePreference('light');
    }
    
    notifyListeners();
  }

  // Set a specific theme mode
  Future<void> setTheme(ThemeMode mode) async {
    _themeMode = mode;
    
    if (mode == ThemeMode.dark) {
      await _saveThemePreference('dark');
    } else if (mode == ThemeMode.light) {
      await _saveThemePreference('light');
    } else {
      await _saveThemePreference('system');
    }
    
    notifyListeners();
  }

  // Save theme preference to SharedPreferences
  Future<void> _saveThemePreference(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(THEME_KEY, value);
  }
}
