import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;

  const HomePage({
    super.key,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isDarkMode ? Color(0xFF0A0A0B) : Color(0xFFFAFAFC);
    final Color textColor = isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    final Color subtitleColor = isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Text(
              'Welcome to GymApp',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: textColor,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Your fitness journey starts here',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 16,
                color: subtitleColor,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 40),
            
            // Quick actions
            Text(
              'Quick Actions',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 16),
            
            // Quick action cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildQuickActionCard(
                    icon: Icons.fitness_center,
                    title: 'Start Workout', 
                    isDarkMode: isDarkMode,
                    onTap: () {},
                  ),
                  _buildQuickActionCard(
                    icon: Icons.calendar_today,
                    title: 'Schedule', 
                    isDarkMode: isDarkMode,
                    onTap: () {},
                  ),
                  _buildQuickActionCard(
                    icon: Icons.bar_chart,
                    title: 'Progress', 
                    isDarkMode: isDarkMode,
                    onTap: () {},
                  ),
                  _buildQuickActionCard(
                    icon: Icons.restaurant,
                    title: 'Nutrition', 
                    isDarkMode: isDarkMode,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required bool isDarkMode,
    required VoidCallback onTap,
  }) {
    final Color surfaceColor = isDarkMode ? Color(0xFF1A1A1D) : Colors.white;
    final Color textColor = isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    final Color shadowColor = isDarkMode ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1);

    return Material(
      borderRadius: BorderRadius.circular(16),
      color: surfaceColor,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: isDarkMode ? 8 : 16,
                offset: Offset(0, isDarkMode ? 4 : 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: const Color(0xFF005C5C),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.bricolageGrotesque(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
