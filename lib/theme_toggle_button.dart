import 'package:flutter/material.dart';
import 'package:fitness_pro/theme_service.dart';
import 'package:provider/provider.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({Key? key}) : super(key: key);

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    // Initialize animation state based on current theme
    final themeService = Provider.of<ThemeService>(context, listen: false);
    if (themeService.isDarkMode) {
      _controller.value = 1.0;
    } else {
      _controller.value = 0.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final isDarkMode = themeService.isDarkMode;
    
    // Update animation controller without triggering animation
    if (isDarkMode && _controller.value == 0.0) {
      _controller.value = 1.0;
    } else if (!isDarkMode && _controller.value == 1.0) {
      _controller.value = 0.0;
    }
    
    // Define colors based on theme
    final surfaceColor = isDarkMode ? const Color(0xFF1A1A1D) : Colors.white;
    final textColor = isDarkMode ? const Color(0xFFE8E8E8) : const Color(0xFF2A2A2A);
    final shadowColor = isDarkMode
        ? Colors.black.withOpacity(0.3)
        : Colors.black.withOpacity(0.05);
    final shadowBlur = isDarkMode ? 8.0 : 12.0;
    final shadowOffset = Offset(0, isDarkMode ? 4 : 6);
    
    return GestureDetector(
      onTap: () {
        final themeService = Provider.of<ThemeService>(context, listen: false);
        themeService.toggleTheme();
        
        if (themeService.isDarkMode) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: shadowBlur,
              offset: shadowOffset,
            ),
          ],
        ),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // Sun Icon
                Opacity(
                  opacity: 1 - _animation.value,
                  child: Transform.rotate(
                    angle: _animation.value * 1.5,
                    child: Icon(
                      Icons.wb_sunny_rounded,
                      color: textColor,
                      size: 20,
                    ),
                  ),
                ),
                // Moon Icon
                Opacity(
                  opacity: _animation.value,
                  child: Transform.rotate(
                    angle: (1 - _animation.value) * -1.5,
                    child: Icon(
                      Icons.nightlight_round,
                      color: textColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
