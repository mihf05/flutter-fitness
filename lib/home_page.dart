import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_pro/theme_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get theme from provider
    final themeService = Provider.of<ThemeService>(context);
    final isDarkMode = themeService.isDarkMode;
    
    final Color backgroundColor = isDarkMode ? Color(0xFF0A0A0B) : Color(0xFFF8F9FA);
    final Color textColor = isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    final Color subtitleColor = isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with profile and notification
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFFFF6B35),
                        child: Text(
                          'S',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '👋 ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Hello, Shariful',
                                style: GoogleFonts.bricolageGrotesque(
                                  fontSize: 14,
                                  color: subtitleColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Welcome Back',
                            style: GoogleFonts.bricolageGrotesque(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    color: textColor,
                    size: 24,
                  ),
                ],
              ),
              
              SizedBox(height: 24),
              
              // Hero Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE8D5FF),
                      Color(0xFFF0E6FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Build Your\nBest Body With Us',
                            style: GoogleFonts.bricolageGrotesque(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2A2A2A),
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Join Now',
                                  style: GoogleFonts.bricolageGrotesque(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/icons/man-gym.png',
                      height: 120,
                      width: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 120,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.fitness_center,
                            size: 40,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32),
              
              // Category Section
              Text(
                'Category',
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              
              SizedBox(height: 16),
              
              // Category Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryItem(
                    icon: '🚴‍♂️',
                    label: 'Cycling',
                    color: Color(0xFFE3F2FD),
                    textColor: textColor,
                  ),
                  _buildCategoryItem(
                    icon: '🏃‍♂️',
                    label: 'Treadmill',
                    color: Color(0xFFE8F5E8),
                    textColor: textColor,
                  ),
                  _buildCategoryItem(
                    icon: '🧘‍♀️',
                    label: 'Yoga',
                    color: Color(0xFFFFF3E0),
                    textColor: textColor,
                  ),
                  _buildCategoryItem(
                    icon: '💪',
                    label: 'Push Up',
                    color: Color(0xFFFFEBEE),
                    textColor: textColor,
                  ),
                ],
              ),
              
              SizedBox(height: 32),
              
              // Today Activity Section
              Text(
                'Today Activity',
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              
              SizedBox(height: 16),
              
              // Activity Items
              _buildActivityItem(
                icon: '🧘‍♀️',
                title: 'Daily Meditation',
                subtitle: '30 minutes a day',
                progress: 0.75,
                progressColor: Color(0xFFFF9800),
                backgroundColor: isDarkMode ? Color(0xFF1A1A1D) : Colors.white,
                textColor: textColor,
                subtitleColor: subtitleColor,
              ),
              
              SizedBox(height: 12),
              
              _buildActivityItem(
                icon: '🚶‍♂️',
                title: 'Walking Steps',
                subtitle: '2000 steps a day',
                progress: 0.6,
                progressColor: Color(0xFF2196F3),
                backgroundColor: isDarkMode ? Color(0xFF1A1A1D) : Colors.white,
                textColor: textColor,
                subtitleColor: subtitleColor,
              ),
              
              SizedBox(height: 12),
              
              _buildActivityItem(
                icon: '🏋️‍♀️',
                title: 'Physical exercise',
                subtitle: '45 minutes a day',
                progress: 0.4,
                progressColor: Color(0xFFE91E63),
                backgroundColor: isDarkMode ? Color(0xFF1A1A1D) : Colors.white,
                textColor: textColor,
                subtitleColor: subtitleColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required String icon,
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              icon,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.bricolageGrotesque(
            fontSize: 12,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required String icon,
    required String title,
    required String subtitle,
    required double progress,
    required Color progressColor,
    required Color backgroundColor,
    required Color textColor,
    required Color subtitleColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: progressColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                icon,
                style: TextStyle(fontSize: 20),
              ),
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
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 4,
              backgroundColor: progressColor.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
        ],
      ),
    );
  }
}