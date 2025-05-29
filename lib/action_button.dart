import 'package:flutter/material.dart';

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
    final Color buttonColor = isEnabled ? Color(0xFF005C5C) : Color(0xFFE8E8E8); // richer teal
    final Color textColor = isEnabled ? Colors.white : Color(0xFF757575);        // blue-gray for inactive text
    final Color borderColor = isEnabled ? Color(0xFF00CA9B) : Color(0xFFBDBDBD); // matches your global border colors


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
            style: TextStyle(
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