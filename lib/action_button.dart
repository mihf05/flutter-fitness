import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_pro/theme_service.dart';
import 'package:provider/provider.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isEnabled;

  const ActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final isDarkMode = themeService.isDarkMode;
    
    // Determine colors based on enabled state and theme
    final Color activeColor = Color(0xFF005C5C); // Primary active color for both themes
    final Color inactiveColorLight = Color(0xFFE8E8E8);
    final Color inactiveColorDark = Color(0xFF2A2A2D);
    final Color inactiveTextLight = Color(0xFF757575);
    final Color inactiveTextDark = Color(0xFF8A8A8A);
    final Color activeBorderLight = Color(0xFF00CA9B);
    final Color activeBorderDark = Color(0xFF00CA9B);
    final Color inactiveBorderLight = Color(0xFFBDBDBD);
    final Color inactiveBorderDark = Color(0xFF3A3A3D);
    
    final Color buttonColor = isEnabled 
        ? activeColor 
        : (isDarkMode ? inactiveColorDark : inactiveColorLight);
    final Color textColor = isEnabled 
        ? Colors.white 
        : (isDarkMode ? inactiveTextDark : inactiveTextLight);
    final Color borderColor = isEnabled 
        ? (isDarkMode ? activeBorderDark : activeBorderLight)
        : (isDarkMode ? inactiveBorderDark : inactiveBorderLight);


    return InkWell(
      onTap: isEnabled ? onPressed : null,
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.bricolageGrotesque(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}