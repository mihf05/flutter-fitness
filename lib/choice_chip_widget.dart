import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceChipWidget extends StatelessWidget {
  final String? iconData;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceChipWidget({
    super.key,
    required this.iconData,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isSelected ? Color(0xFF005C5C) : Colors.white;
    final Color contentColor = isSelected ? Colors.white : Color(0xFF1F2832);
    final Color borderColor = isSelected ? Color(0xFF00CA9B) : Color(0xFFBDBDBD);
    final Color shadowColor = isSelected ?  Color(0x4D006666) : Color(0x40000000);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.0), // Match container's border radius
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24.0), // Rounded corners
            border: Border.all( // Add a border for definition
              color: borderColor,
              width: 1.5,
            ),
            boxShadow:  [
              BoxShadow(
                color:shadowColor,
                blurRadius: 5.0,
                offset: const Offset(0, 2),
              ),
            ]
                , // No shadow when not selected
          ),
          child: Row( // Arrange Icon and Text vertically
            mainAxisSize: MainAxisSize.min, // Fit content size
            children: [
              Image.asset(
                "assets/icons/$iconData",
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported_outlined, size: 20);
                },
              ),
              const SizedBox(width: 6.0), // Space between icon and text
              Text(
                text,
                style: GoogleFonts.bricolageGrotesque(
                  color: contentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
