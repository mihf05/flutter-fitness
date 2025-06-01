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

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Month/Year
              Text(
                'July 2022',
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 20),
              
              // Weekly Calendar
              _buildWeeklyCalendar(isDarkMode, textColor, subtitleColor),
              
              SizedBox(height: 32),
              
              // Today Report Header
              Text(
                'Today Report',
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 16),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Top Row - Active Calories and Cycling
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Active Calories
                            Expanded(
                              flex: 3,
                              child: _buildActiveCaloriesCard(isDarkMode, surfaceColor, textColor, subtitleColor),
                            ),
                            SizedBox(width: 8),
                            // Cycling Activity
                            Expanded(
                              flex: 4,
                              child: _buildCyclingCard(isDarkMode, surfaceColor, textColor, subtitleColor),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 12),
                      
                      // Second Row - Heart Rate and Steps
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _buildHeartRateCard(isDarkMode, surfaceColor, textColor, subtitleColor),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: _buildStepsCard(isDarkMode, surfaceColor, textColor, subtitleColor),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 12),
                      
                      // Third Row - Sleep and Water
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _buildSleepCard(isDarkMode, surfaceColor, textColor, subtitleColor),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: _buildWaterCard(isDarkMode, surfaceColor, textColor, subtitleColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20), // Bottom padding
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeeklyCalendar(bool isDarkMode, Color textColor, Color subtitleColor) {
    final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    final dates = ['10', '11', '12', '13', '14', '15', '16'];
    final selectedIndex = 2; // Tuesday is selected
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final isSelected = index == selectedIndex;
        final isToday = index == 2; // Tuesday is today
        
        return Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected 
                    ? Color(0xFF8BC34A) 
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  days[index],
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : subtitleColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              dates[index],
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 12,
                color: subtitleColor,
              ),
            ),
            if (isToday) ...[
              SizedBox(height: 2),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Color(0xFF8BC34A),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        );
      }),
    );
  }

  Widget _buildActiveCaloriesCard(bool isDarkMode, Color surfaceColor, Color textColor, Color subtitleColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF2A2A2A), // Dark background like in the image
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Active calories',
            style: GoogleFonts.bricolageGrotesque(
              fontSize: 11,
              color: Color(0xFFB0B0B0),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '645 Cal',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Training time',
            style: GoogleFonts.bricolageGrotesque(
              fontSize: 11,
              color: Color(0xFFB0B0B0),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          // Training time progress with circular indicator and bar
          Row(
            children: [
              // Circular progress indicator
              Container(
                width: 30,
                height: 30,
                child: Stack(
                  children: [
                    CircularProgressIndicator(
                      value: 0.8,
                      strokeWidth: 2.5,
                      backgroundColor: Color(0xFF404040),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8BC34A)),
                    ),
                    Center(
                      child: Text(
                        '80%',
                        style: GoogleFonts.bricolageGrotesque(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              // Progress bar with striped pattern
              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: CustomPaint(
                    painter: StripedProgressPainter(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCyclingCard(bool isDarkMode, Color surfaceColor, Color textColor, Color subtitleColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.directions_bike,
                  size: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  'Cycling',
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Map placeholder with route
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF3A3A3A),
                borderRadius: BorderRadius.circular(6),
              ),
              child: CustomPaint(
                painter: MapRoutePainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartRateCard(bool isDarkMode, Color surfaceColor, Color textColor, Color subtitleColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                color: Color(0xFFFF4444),
                size: 14,
              ),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  'Heart Rate',
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 11,
                    color: subtitleColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Heart rate chart
          Container(
            height: 40,
            width: double.infinity,
            child: CustomPaint(
              painter: HeartRateChartPainter(),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '77 bpm',
            style: GoogleFonts.bricolageGrotesque(
              fontSize: 11,
              color: subtitleColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepsCard(bool isDarkMode, Color surfaceColor, Color textColor, Color subtitleColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.directions_walk,
                color: Color(0xFFFF9800),
                size: 14,
              ),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  'Steps',
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 11,
                    color: Color(0xFF666666),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '999/2000',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2A2A2A),
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  'Keep it Up! ',
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 11,
                    color: Color(0xFF666666),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '💪',
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSleepCard(bool isDarkMode, Color surfaceColor, Color textColor, Color subtitleColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.bedtime,
                color: Color(0xFF6366F1),
                size: 14,
              ),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  'Sleep',
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 11,
                    color: subtitleColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Sleep chart
          Container(
            height: 40,
            width: double.infinity,
            child: CustomPaint(
              painter: SleepChartPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterCard(bool isDarkMode, Color surfaceColor, Color textColor, Color subtitleColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.water_drop,
                color: Color(0xFF2196F3),
                size: 14,
              ),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  'Water',
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 11,
                    color: Color(0xFF666666),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '6/8 Cups',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2A2A2A),
              ),
            ),
          ),
          SizedBox(height: 8),
          // Water progress indicator
          Container(
            width: double.infinity,
            height: 4,
            decoration: BoxDecoration(
              color: Color(0xFFBBDEFB),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.75,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painters for charts
class StripedProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Background
    final bgPaint = Paint()
      ..color = Color(0xFF404040)
      ..style = PaintingStyle.fill;
    
    final bgRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(4),
    );
    canvas.drawRRect(bgRect, bgPaint);
    
    // Progress fill (80% of width)
    final progressWidth = size.width * 0.8;
    final progressRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, progressWidth, size.height),
      Radius.circular(4),
    );
    
    // Gradient from yellow to green
    final gradient = LinearGradient(
      colors: [Color(0xFFFFEB3B), Color(0xFF8BC34A)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    
    final progressPaint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, progressWidth, size.height))
      ..style = PaintingStyle.fill;
    
    canvas.drawRRect(progressRect, progressPaint);
    
    // Draw diagonal stripes
    final stripePaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..strokeWidth = 1;
    
    for (double i = -size.height; i < progressWidth + size.height; i += 6) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        stripePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MapRoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF8BC34A)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.4, size.height * 0.2,
      size.width * 0.6, size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.8, size.height * 0.6,
      size.width * 0.9, size.height * 0.3,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HeartRateChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFFF4444)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.fill;

    final barWidth = size.width / 20;
    final heights = [0.3, 0.6, 0.4, 0.8, 0.5, 0.7, 0.9, 0.6, 0.4, 0.7, 0.8, 0.5, 0.9, 0.6, 0.3, 0.7, 0.8, 0.4, 0.6, 0.5];

    for (int i = 0; i < heights.length; i++) {
      final rect = Rect.fromLTWH(
        i * barWidth,
        size.height * (1 - heights[i]),
        barWidth * 0.8,
        size.height * heights[i],
      );
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SleepChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF6366F1)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.fill;

    final barWidth = size.width / 7;
    final heights = [0.6, 0.8, 0.4, 0.7, 0.9, 0.5, 0.6];

    for (int i = 0; i < heights.length; i++) {
      final rect = Rect.fromLTWH(
        i * barWidth,
        size.height * (1 - heights[i]),
        barWidth * 0.7,
        size.height * heights[i],
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(2)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}