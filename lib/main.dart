import 'package:flutter/material.dart';
import 'package:multi_choice_widget/workout_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymApp Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.p,
        // fontFamily: 'Lato',
        useMaterial3: true,
      ),
      home:  WorkoutSelectionPage()
        // home:  WorkoutSelectorPage()
    );
  }
}


