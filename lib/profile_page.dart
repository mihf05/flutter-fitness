import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  final bool isDarkMode;

  const ProfilePage({
    super.key,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isDarkMode ? Color(0xFF0A0A0B) : Color(0xFFFAFAFC);
    final Color surfaceColor = isDarkMode ? Color(0xFF1A1A1D) : Colors.white;
    final Color textColor = isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    final Color subtitleColor = isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666);
    final Color borderColor = isDarkMode ? Color(0xFF333333) : Color(0xFFEEEEEE);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF005C5C),
                      border: Border.all(
                        color: surfaceColor,
                        width: 4,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'JD',
                        style: GoogleFonts.bricolageGrotesque(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: GoogleFonts.bricolageGrotesque(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Fitness Enthusiast',
                        style: GoogleFonts.bricolageGrotesque(
                          fontSize: 16,
                          color: subtitleColor,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 32),
              
              // Stats
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(16),
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
                    _buildStat(
                      value: '28',
                      label: 'Workouts',
                      isDarkMode: isDarkMode,
                    ),
                    _buildStatDivider(isDarkMode),
                    _buildStat(
                      value: '14.5',
                      label: 'Hours',
                      isDarkMode: isDarkMode,
                    ),
                    _buildStatDivider(isDarkMode),
                    _buildStat(
                      value: '3200',
                      label: 'Calories',
                      isDarkMode: isDarkMode,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32),
              
              // Settings
              Text(
                'Settings',
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 16),
              
              // Settings options
              _buildSettingsItem(
                icon: Icons.person_outline,
                title: 'Personal Information',
                isDarkMode: isDarkMode,
              ),
              _buildSettingsItem(
                icon: Icons.notifications_none,
                title: 'Notifications',
                isDarkMode: isDarkMode,
              ),
              _buildSettingsItem(
                icon: Icons.fitness_center_outlined,
                title: 'Workout Preferences',
                isDarkMode: isDarkMode,
              ),
              _buildSettingsItem(
                icon: Icons.help_outline,
                title: 'Help & Support',
                isDarkMode: isDarkMode,
              ),
              _buildSettingsItem(
                icon: Icons.logout,
                title: 'Sign Out',
                isDarkMode: isDarkMode,
                isDestructive: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildStat({
    required String value, 
    required String label,
    required bool isDarkMode,
  }) {
    final Color textColor = isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    final Color subtitleColor = isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666);
    
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.bricolageGrotesque(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF005C5C),
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.bricolageGrotesque(
              fontSize: 14,
              color: subtitleColor,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStatDivider(bool isDarkMode) {
    final Color dividerColor = isDarkMode ? Color(0xFF333333) : Color(0xFFEEEEEE);
    
    return Container(
      height: 40,
      width: 1,
      color: dividerColor,
    );
  }
  
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required bool isDarkMode,
    bool isDestructive = false,
  }) {
    final Color surfaceColor = isDarkMode ? Color(0xFF1A1A1D) : Colors.white;
    final Color textColor = isDestructive 
        ? Colors.redAccent
        : (isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A));
    final Color iconColor = isDestructive 
        ? Colors.redAccent 
        : (isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666));
    
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode 
                ? Colors.black.withOpacity(0.1)
                : Colors.black.withOpacity(0.02),
            blurRadius: isDarkMode ? 4 : 6,
            offset: Offset(0, isDarkMode ? 1 : 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: iconColor,
                ),
                SizedBox(width: 16),
                Text(
                  title,
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                Spacer(),
                if (!isDestructive)
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: iconColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
