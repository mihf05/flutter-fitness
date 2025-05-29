import 'package:flutter/material.dart';
import 'package:multi_choice_widget/action_button.dart';

import 'choice_chip_widget.dart';

class WorkoutSelectionPage extends StatefulWidget {
  const WorkoutSelectionPage({super.key});

  @override
  State<WorkoutSelectionPage> createState() => _WorkoutSelectionPageState();
}

class _WorkoutSelectionPageState extends State<WorkoutSelectionPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F6FF),
        appBar: AppBar(
          title: Text("Focus Area"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose two or more to continue",
              style: TextStyle(
                  // fontSize: 18
                  ),
            ),
            SizedBox(
              height: 96,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Wrap(
                  // spacing: 8.0, // Space between items horizontally
                  runSpacing: 4.0, // Space between lines vertically
                  alignment: WrapAlignment.center, // Center align the children
                  children: workoutSelection.entries.map((entry) {
                    // For each workout and its selection status, create a widget
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
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButton(
                    onPressed:  () {
                      print("I am being clicked");
                    },
                    isEnabled: count>1,
                    label: "Continue"),
              ],
            ),

            SizedBox(
              height: 40,
            )
          ],
        ));
  }
}
