import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_choice_widget/action_button.dart';

import 'choice_chip_widget.dart';

class WorkoutSelectionPage extends StatefulWidget {
  const WorkoutSelectionPage({super.key});

  @override
  State<WorkoutSelectionPage> createState() => _WorkoutSelectionPageState();
}

class _WorkoutSelectionPageState extends State<WorkoutSelectionPage>
    with TickerProviderStateMixin {
  Map<String, bool> workoutSelection = {
    "Cardio": false,
    "Strength": false,
    "Power": false,
    "Core": false,
    "Grip": false,
    "Interval": false,
    "Endurance": false,
    "Fat Loss": false,
    "Performance": false,
    "Competitive": false,
    "Nutrition": false,
  };

  Map<String, String> iconsMap = {
    "Cardio": "heart_icon.png",
    "Strength": "dumbbell_icon.png",
    "Power": "barbell_plates_icon.png",
    "Core": "kettlebell_icon.png",
    "Grip": "spring_hand_machine_icon.png",
    "Interval": "stopwatch_icon.png",
    "Endurance": "treadmill_icon.png",
    "Fat Loss": "weighing_machine_icon.png",
    "Performance": "medal_icon.png",
    "Competitive": "calendar_icon.png",
    "Nutrition": "protein_shaker_icon.png",
  };

  int count = 0;
  bool isDarkMode = false;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Color get backgroundColor => isDarkMode ? Color(0xFF0A0A0B) : Color(0xFFFAFAFC);
  Color get surfaceColor => isDarkMode ? Color(0xFF1A1A1D) : Colors.white;
  Color get textColor => isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
  Color get subtitleColor => isDarkMode ? Color(0xFFB0B0B0) : Color(0xFF666666);
  Color get accentColor => isDarkMode ? Color(0xFF6366F1) : Color(0xFF4F46E5);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Minimal App Bar
              SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Row(
                    children: [
                      // Back Button
                      Container(
                        width: 44,
                        height: 44,
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
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: textColor,
                          size: 20,
                        ),
                      ),
                        Expanded(
                        child: Text(
                          "Focus Area",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bricolageGrotesque(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      
                      // Theme Toggle Button (will be implemented separately)
                      ThemeToggleButton(
                        isDarkMode: isDarkMode,
                        onToggle: () {
                          setState(() {
                            isDarkMode = !isDarkMode;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 48),

              // Minimal Header Section
              FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        "Choose two or more to continue",
                        style: GoogleFonts.bricolageGrotesque(
                          color: subtitleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2,
                        ),
                      ),
                      SizedBox(height: 12),
                      
                      // Progress Indicator
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: count >= 2 
                              ? accentColor.withOpacity(0.1)
                              : surfaceColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: count >= 2 
                                ? accentColor.withOpacity(0.3)
                                : Colors.transparent,
                            width: 1,
                          ),
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
                        child: Text(
                          "$count selected",
                          style: GoogleFonts.bricolageGrotesque(
                            color: count >= 2 ? accentColor : subtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 48), // Choice Chips (without card container)
              Expanded(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 12.0,
                        runSpacing: 12.0,
                        alignment: WrapAlignment.center,
                        children: workoutSelection.entries.map((entry) {
                          return ChoiceChipWidget(
                            iconData: iconsMap[entry.key],
                            text: entry.key,
                            isSelected: entry.value,
                            onTap: () {
                              setState(() {
                                workoutSelection[entry.key] =
                                    !workoutSelection[entry.key]!;

                                if (workoutSelection[entry.key] == true) {
                                  count += 1;
                                } else {
                                  count -= 1;
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),

              // Minimal Continue Button
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _slideController,
                  curve: Interval(0.3, 1.0, curve: Curves.easeOut),
                )),
                child: Container(
                  margin: EdgeInsets.all(24),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: count > 1 ? accentColor : subtitleColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: count > 1
                          ? [
                              BoxShadow(
                                color: accentColor.withOpacity(0.3),
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ]
                          : [],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: count > 1
                            ? () {
                                print("I am being clicked");
                              }
                            : null,
                        child: Center(
                          child: Text(
                            "Continue",
                            style: GoogleFonts.bricolageGrotesque(
                              color: count > 1 
                                  ? Colors.white 
                                  : Colors.white.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Separate Theme Toggle Button Component
class ThemeToggleButton extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggle;

  const ThemeToggleButton({
    Key? key,
    required this.isDarkMode,
    required this.onToggle,
  }) : super(key: key);

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
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    if (widget.isDarkMode) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(ThemeToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDarkMode != oldWidget.isDarkMode) {
      if (widget.isDarkMode) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color surfaceColor = widget.isDarkMode ? Color(0xFF1A1A1D) : Colors.white;
    Color textColor = widget.isDarkMode ? Color(0xFFE8E8E8) : Color(0xFF2A2A2A);
    
    return GestureDetector(
      onTap: widget.onToggle,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: widget.isDarkMode 
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black.withOpacity(0.05),
              blurRadius: widget.isDarkMode ? 8 : 12,
              offset: Offset(0, widget.isDarkMode ? 4 : 6),
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