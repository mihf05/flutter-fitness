import 'package:flutter/material.dart';

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
    // Check if dark mode is enabled (based on MediaQuery)
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Colors based on the app's theme system
    final backgroundColor = isDarkMode ? const Color(0xFF1A1A1D) : Colors.white;
    final selectedItemColor = const Color(0xFF005C5C);  // Primary teal color
    final unselectedItemColor = isDarkMode ? const Color(0xFF8A8A8A) : const Color(0xFFAAAAAA);
    final shadowColor = isDarkMode ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: backgroundColor,
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
            BottomNavigationBarItem(
              icon: Image.network(
                'assets/icons/home_icon.png',
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.home_outlined),
                loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              activeIcon: Image.network(
                'assets/icons/home_icon.png',
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.home_rounded),
                loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                'assets/icons/dumbbell_icon.png',
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.fitness_center_outlined),
                loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              activeIcon: Image.network(
                'assets/icons/dumbbell_icon.png',
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.fitness_center),
                loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              label: 'Workouts',
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                'assets/icons/chart.png',
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.bar_chart_outlined),
                loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              activeIcon: Image.network(
                'assets/icons/chart.png',
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.bar_chart),
                loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                'assets/icons/profile.png',
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.person_outlined),
                loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              activeIcon: Image.network(
                'assets/icons/profile.png',
                width: 28,
                height: 28,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
