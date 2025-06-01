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
    final Color backgroundColor = isDarkMode ? Color(0xFF0A0A0B) : Color(0xFFF8F9FA);
    final Color surfaceColor = isDarkMode ? Color(0xFF1A1A1D) : Colors.white;
    final Color textColor = isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    final Color subtitleColor = isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666);
    final Color primaryColor = Color(0xFF007AFF);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              
              // Profile section
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Philip Stefanov',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    // Stats row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn('377', 'Workouts', textColor, subtitleColor),
                        _buildStatColumn('77', 'Followers', textColor, subtitleColor),
                        _buildStatColumn('32', 'Following', textColor, subtitleColor),
                      ],
                    ),
                    SizedBox(height: 20),
                    
                    // Website link
                    Text(
                      'www.fit.com/about-us/',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32),
              
              // Time period selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '25 mins this week',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Last 3 months',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down, 
                             color: primaryColor, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              
              // Chart section
              Container(
                height: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildBarChart(0.4, primaryColor),
                          _buildBarChart(0.7, primaryColor),
                          _buildBarChart(0.5, primaryColor),
                          _buildBarChart(0.6, primaryColor),
                          _buildBarChart(0.9, primaryColor),
                          _buildBarChart(0.8, primaryColor),
                          _buildBarChart(0.6, primaryColor),
                          _buildBarChart(0.7, primaryColor),
                          _buildBarChart(0.5, primaryColor),
                          _buildBarChart(0.8, primaryColor),
                          _buildBarChart(0.9, primaryColor),
                          _buildBarChart(0.4, primaryColor),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildChartTab('Duration', true, primaryColor, textColor),
                        _buildChartTab('Volume', false, primaryColor, subtitleColor),
                        _buildChartTab('Reps', false, primaryColor, subtitleColor),
                      ],
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 24),
              
              // Dashboard section
              Text(
                'Dashboard',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              SizedBox(height: 16),
              
              // Dashboard grid
              Row(
                children: [
                  Expanded(
                    child: _buildDashboardItem(
                      Icons.bar_chart_outlined,
                      'Statistics',
                      surfaceColor,
                      textColor,
                      subtitleColor,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _buildDashboardItem(
                      Icons.fitness_center_outlined,
                      'Exercises',
                      surfaceColor,
                      textColor,
                      subtitleColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildDashboardItem(
                      Icons.straighten_outlined,
                      'Measures',
                      surfaceColor,
                      textColor,
                      subtitleColor,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _buildDashboardItem(
                      Icons.calendar_today_outlined,
                      'Calendar',
                      surfaceColor,
                      textColor,
                      subtitleColor,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 24),
              
              // Workouts section
              Text(
                'Workouts',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              SizedBox(height: 16),
              
              // Workout item
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(12),
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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'philip_stefanov',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                          Text(
                            'Tuesday, Jan 27, 2024',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: subtitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz, color: subtitleColor),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 24), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildStatColumn(String value, String label, Color textColor, Color subtitleColor) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }
  
  Widget _buildBarChart(double height, Color color) {
    return Container(
      width: 20,
      height: 120 * height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
  
  Widget _buildChartTab(String title, bool isSelected, Color primaryColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : textColor,
        ),
      ),
    );
  }
  
  Widget _buildDashboardItem(IconData icon, String title, Color surfaceColor, Color textColor, Color subtitleColor) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: subtitleColor, size: 24),
          SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}