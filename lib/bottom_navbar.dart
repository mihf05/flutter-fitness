import 'package:flutter/material.dart';
import 'dart:ui';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Glassmorphism colors
    final glassColor = isDarkMode 
        ? Colors.white.withOpacity(0.1) 
        : Colors.white.withOpacity(0.25);
    final borderColor = isDarkMode 
        ? Colors.white.withOpacity(0.2) 
        : Colors.white.withOpacity(0.3);
    final selectedItemColor = const Color(0xFF005C5C);
    final unselectedItemColor = isDarkMode 
        ? Colors.white.withOpacity(0.6) 
        : Colors.black.withOpacity(0.5);

    return Container(
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: glassColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: borderColor,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: currentIndex,
              onTap: onTap,
              selectedItemColor: selectedItemColor,
              unselectedItemColor: unselectedItemColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              elevation: 0,
              items: [
                _buildNavItem(
                  iconPath: 'assets/icons/home_icon.png',
                  label: 'Home',
                  fallbackIcon: Icons.home_outlined,
                  activeFallbackIcon: Icons.home_rounded,
                ),
                _buildNavItem(
                  iconPath: 'assets/icons/dumbbell_icon.png',
                  label: 'Workouts',
                  fallbackIcon: Icons.fitness_center_outlined,
                  activeFallbackIcon: Icons.fitness_center,
                ),
                _buildNavItem(
                  iconPath: 'assets/icons/chart.png',
                  label: 'Progress',
                  fallbackIcon: Icons.bar_chart_outlined,
                  activeFallbackIcon: Icons.bar_chart,
                ),
                _buildNavItem(
                  iconPath: 'assets/icons/profile.png',
                  label: 'Profile',
                  fallbackIcon: Icons.person_outlined,
                  activeFallbackIcon: Icons.person,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required IconData fallbackIcon,
    required IconData activeFallbackIcon,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.network(
          iconPath,
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) => Icon(
            fallbackIcon,
            size: 24,
          ),
          loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null 
              ? child 
              : SizedBox(
                  width: 24, 
                  height: 24, 
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
        ),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF005C5C).withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF005C5C).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Image.network(
          iconPath,
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) => Icon(
            activeFallbackIcon,
            size: 24,
          ),
          loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null 
              ? child 
              : SizedBox(
                  width: 24, 
                  height: 24, 
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: const Color(0xFF005C5C),
                  ),
                ),
        ),
      ),
      label: label,
    );
  }
}