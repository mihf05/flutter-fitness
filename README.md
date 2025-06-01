# Flutter Custom Choice Chips

A beautiful and animated Flutter application showcasing custom choice chips with a modern UI design. This project demonstrates how to create interactive workout selection interface with smooth animations and theme toggling capabilities.

## Demo

| Light Mode Demo                                                                 | Dark Mode Demo                                                                  |
|---------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| ![Light Mode Demo](https://i.postimg.cc/hjjfxxWq/localhost-54512-i-Phone-12-Pro-1.png) | ![Dark Mode Demo](https://i.postimg.cc/W1Bn5NpK/localhost-54512-i-Phone-12-Pro.png) |

## Features

✨ **Modern UI Design**
- Clean and minimal interface
- Smooth animations and transitions
- Dark/Light theme support
- Custom choice chips with icons

🎯 **Interactive Elements**
- Multi-selection choice chips
- Real-time selection counter
- Dynamic continue button state
- Animated progress indicators

🎨 **Theme System**
- Toggle between dark and light modes with beautiful animations
- Persistent theme preferences using SharedPreferences
- Consistent color schemes across all app screens
- Smooth theme transitions for all UI components
- System theme integration with Provider pattern

## Getting Started

### Prerequisites

- Flutter SDK (3.6.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. Clone the repository:
```bash
git clone https://github.com/mihf05/flutter-fitness.git
cd flutter-custom-choice-chips
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── app_theme.dart            # Theme configurations for light/dark mode
├── theme_service.dart        # Theme state management with persistence
├── theme_toggle_button.dart  # Animated theme toggle button
├── workout_selection.dart    # Main workout selection page
├── choice_chip_widget.dart   # Custom choice chip component
└── action_button.dart        # Reusable action button component

assets/
├── fonts/
│   └── Lato-Regular.ttf     # Custom font
└── icons/                   # Workout category icons
    ├── heart_icon.png
    ├── dumbbell_icon.png
    ├── barbell_plates_icon.png
    └── ... (more icons)
```

## Key Components

### WorkoutSelectionPage
The main page component featuring:
- Animated header with theme toggle
- Progress indicator showing selection count
- Grid of workout category choice chips
- Dynamic continue button

### ChoiceChipWidget
A custom widget for selectable workout categories:
- Icon and text display
- Selection state management
- Smooth tap animations
- Theme-aware styling

### ThemeToggleButton
Animated button for switching between light and dark themes:
- Smooth rotation animation using AnimationController
- Theme-aware icons (sun/moon)
- Seamless state transitions
- Persists theme preference

### ThemeService
Core service for managing app theme:
- Singleton pattern for global theme state
- Uses SharedPreferences for persistence
- Notifies listeners when theme changes
- Supports system, light, and dark modes

## Dependencies

- **flutter**: Core Flutter framework
- **google_fonts**: Custom typography (Bricolage Grotesque)
- **cupertino_icons**: iOS-style icons
- **provider**: State management and theme dependency injection
- **shared_preferences**: Persistence of theme preferences

## Customization

### Adding New Workout Categories

1. Update the `workoutSelection` map in `workout_selection.dart`:
```dart
Map<String, bool> workoutSelection = {
  "Your Category": false,
  // ... existing categories
};
```

2. Add corresponding icon to `iconsMap`:
```dart
Map<String, String> iconsMap = {
  "Your Category": "your_icon.png",
  // ... existing icons
};
```

3. Add the icon asset to `assets/icons/` directory

### Theming

The app uses a centralized theme system defined in `app_theme.dart`:

```dart
// Light theme colors
static final lightColors = {
  'background': const Color(0xFFFAFAFC),
  'surface': Colors.white,
  'text': const Color(0xFF2A2A2A),
  'subtitle': const Color(0xFF666666),
  'accent': const Color(0xFF4F46E5),
  'primary': const Color(0xFF005C5C),
};

// Dark theme colors
static final darkColors = {
  'background': const Color(0xFF0A0A0B),
  'surface': const Color(0xFF1A1A1D),
  'text': const Color(0xFFE8E8E8),
  'subtitle': const Color(0xFFB0B0B0),
  'accent': const Color(0xFF6366F1),
  'primary': const Color(0xFF005C5C),
};
```

To use the theme in any widget:

```dart
// Get theme from provider
final themeService = Provider.of<ThemeService>(context);
final isDarkMode = themeService.isDarkMode;

// Use theme-aware colors
final backgroundColor = isDarkMode ? const Color(0xFF0A0A0B) : const Color(0xFFFAFAFC);
```

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Acknowledgments

- Icons designed for fitness and workout categories
- Inspired by modern mobile app design principles
- Built with Flutter's powerful animation framework
