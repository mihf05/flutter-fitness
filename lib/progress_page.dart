import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_pro/theme_service.dart';
import 'package:provider/provider.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get theme from provider
    final themeService = Provider.of<ThemeService>(context);
    final isDarkMode = themeService.isDarkMode;
    
    final Color backgroundColor = isDarkMode ? Color(0xFF0A0A0B) : Color(0xFFFAFAFC);
    final Color surfaceColor = isDarkMode ? Color(0xFF1A1A1D) : Colors.white;
    final Color textColor = isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    final Color subtitleColor = isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666);
    final Color accentColor = isDarkMode ? Color(0xFF6366F1) : Color(0xFF4F46E5);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Progress',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: textColor,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Track your fitness journey',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 16,
                color: subtitleColor,
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 32),
            
            // Progress Chart (Placeholder)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode 
                        ? Colors.black.withOpacity(0.3)
                        : Colors.black.withOpacity(0.05),
                    blurRadius: isDarkMode ? 8 : 12,
                    offset: Offset(0, isDarkMode ? 4 : 6),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bar_chart,
                      size: 48,
                      color: accentColor,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Progress Chart',
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Workout data will be displayed here',
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 14,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 32),
            
            // Recent Activities
            Text(
              'Recent Activities',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 16),
            
            Expanded(
              child: ListView(
                children: [
                  _buildActivityItem(
                    title: 'Strength Training',
                    subtitle: 'Today, 10:30 AM • 45 minutes',
                    icon: Icons.fitness_center,
                    isDarkMode: isDarkMode,
                  ),
                  SizedBox(height: 12),
                  _buildActivityItem(
                    title: 'Cardio Session',
                    subtitle: 'Yesterday, 8:15 AM • 30 minutes',
                    icon: Icons.directions_run,
                    isDarkMode: isDarkMode,
                  ),
                  SizedBox(height: 12),
                  _buildActivityItem(
                    title: 'Core Workout',
                    subtitle: 'May 28, 9:45 AM • 20 minutes',
                    icon: Icons.sports_gymnastics,
                    isDarkMode: isDarkMode,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isDarkMode,
  }) {
    final Color surfaceColor = isDarkMode ? Color(0xFF1A1A1D) : Colors.white;
    final Color textColor = isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    final Color subtitleColor = isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666);
    final Color iconBgColor = isDarkMode ? Color(0xFF005C5C).withOpacity(0.2) : Color(0xFF005C5C).withOpacity(0.1);
    
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode 
                ? Colors.black.withOpacity(0.2)
                : Colors.black.withOpacity(0.03),
            blurRadius: isDarkMode ? 6 : 8,
            offset: Offset(0, isDarkMode ? 2 : 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Color(0xFF005C5C),
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 14,
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: subtitleColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
