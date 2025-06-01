import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_choice_widget/action_button.dart';
import 'package:multi_choice_widget/theme_service.dart';
import 'package:provider/provider.dart';

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

  // User preferences for each workout type
  Map<String, Map<String, dynamic>> workoutPreferences = {};

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

  // Show preferences dialog when workout is selected
  void _showPreferencesDialog(String workoutType) {
    double weight = workoutPreferences[workoutType]?['weight'] ?? 70.0;
    double lightingIntensity = workoutPreferences[workoutType]?['lighting'] ?? 50.0;
    int exerciseCount = workoutPreferences[workoutType]?['count'] ?? 10;
    int duration = workoutPreferences[workoutType]?['time'] ?? 30;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: surfaceColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(
                '$workoutType Preferences',
                style: GoogleFonts.bricolageGrotesque(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Weight Slider
                    _buildSliderSection(
                      'Weight (kg)',
                      weight,
                      20.0,
                      150.0,
                      (value) => setDialogState(() => weight = value),
                      '${weight.round()} kg',
                    ),
                    SizedBox(height: 16),
                    
                    // Lighting Intensity Slider
                    _buildSliderSection(
                      'Lighting Intensity',
                      lightingIntensity,
                      0.0,
                      100.0,
                      (value) => setDialogState(() => lightingIntensity = value),
                      '${lightingIntensity.round()}%',
                    ),
                    SizedBox(height: 16),
                    
                    // Exercise Count Slider
                    _buildSliderSection(
                      'Exercise Count',
                      exerciseCount.toDouble(),
                      5.0,
                      50.0,
                      (value) => setDialogState(() => exerciseCount = value.round()),
                      '${exerciseCount} exercises',
                    ),
                    SizedBox(height: 16),
                    
                    // Duration Slider
                    _buildSliderSection(
                      'Duration (minutes)',
                      duration.toDouble(),
                      10.0,
                      120.0,
                      (value) => setDialogState(() => duration = value.round()),
                      '${duration} min',
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.bricolageGrotesque(
                      color: subtitleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      workoutPreferences[workoutType] = {
                        'weight': weight,
                        'lighting': lightingIntensity,
                        'count': exerciseCount,
                        'time': duration,
                      };
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: GoogleFonts.bricolageGrotesque(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSliderSection(String title, double value, double min, double max, 
      Function(double) onChanged, String displayValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.bricolageGrotesque(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              displayValue,
              style: GoogleFonts.bricolageGrotesque(
                color: accentColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 4,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
            activeTrackColor: accentColor,
            inactiveTrackColor: subtitleColor.withOpacity(0.3),
            thumbColor: accentColor,
            overlayColor: accentColor.withOpacity(0.2),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
    @override
  Widget build(BuildContext context) {
    // Get theme from provider and update isDarkMode
    final themeService = Provider.of<ThemeService>(context);
    isDarkMode = themeService.isDarkMode;
    
    return SafeArea(
      child: Column(
        children: [
          // Custom App Bar
          SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Row(
                children: [
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
                ],
              ),
            ),
          ),

          SizedBox(height: 24),

          // Choice Chips
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
                          if (!workoutSelection[entry.key]!) {
                            // Show preferences dialog when selecting
                            _showPreferencesDialog(entry.key!);
                          }
                          
                          setState(() {
                            workoutSelection[entry.key] = !workoutSelection[entry.key]!;

                            if (workoutSelection[entry.key] == true) {
                              count += 1;
                            } else {
                              count -= 1;
                              // Remove preferences when deselected
                              workoutPreferences.remove(entry.key);
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

          // Compact Combined Button
          SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, 0.2),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _slideController,
              curve: Interval(0.3, 1.0, curve: Curves.easeOut),
            )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 48,
                decoration: BoxDecoration(
                  color: count > 1 ? accentColor : surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  border: count <= 1 ? Border.all(
                    color: subtitleColor.withOpacity(0.2),
                    width: 1,
                  ) : null,
                  boxShadow: [
                    BoxShadow(
                      color: count > 1 
                          ? accentColor.withOpacity(0.2)
                          : Colors.black.withOpacity(0.03),
                      blurRadius: count > 1 ? 8 : 4,
                      offset: Offset(0, count > 1 ? 4 : 2),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: count > 1
                        ? () {
                            print("Continue with preferences: $workoutPreferences");
                          }
                        : null,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Compact Counter
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: count > 1 
                                  ? Colors.white.withOpacity(0.2)
                                  : accentColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "$count",
                                style: GoogleFonts.bricolageGrotesque(
                                  color: count > 1 
                                      ? Colors.white 
                                      : accentColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(width: 12),
                          
                          // Compact Text
                          Text(
                            count > 1 ? "Continue" : "Select $count",
                            style: GoogleFonts.bricolageGrotesque(
                              color: count > 1 
                                  ? Colors.white 
                                  : textColor.withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          
                          if (count > 1) ...[
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Removed ThemeToggleButton to avoid conflict with theme_toggle_button.dart