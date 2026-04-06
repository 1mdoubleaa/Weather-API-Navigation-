# Weather App

A Flutter weather application that fetches real-time weather data using the [OpenWeatherMap API](https://openweathermap.org/api). Search any city in the world to see current conditions including temperature, humidity, wind speed, and more — with animated weather visuals.

## Features

- Search weather by city name
- Displays current temperature, feels like, high/low, humidity, pressure, wind speed, visibility, and cloud cover
- Lottie animations that match the current weather condition (sunny, cloudy, rain, snow, fog, thunderstorm)
- Built with Flutter — runs on Chrome (web) and Windows desktop

## Tech Stack

- **Flutter** (Dart)
- **OpenWeatherMap Current Weather API** (free tier, 2.5)
- **http** package for API calls
- **lottie** package for weather animations

## Project Structure

```
lib/
├── constants/
│   └── app_constants.dart    # API key, base URL, asset paths
├── models/
│   └── weather_response.dart # Data models for API response
├── pages/
│   └── homepage.dart         # Main UI with search and weather display
├── services/
│   └── weather_service.dart  # HTTP calls to OpenWeatherMap
├── widgets/
│   └── weather_animation.dart # Lottie animation selector
└── main.dart
```

## Setup

1. Clone the repository
2. Get dependencies:
   ```bash
   flutter pub get
   ```
3. Add your OpenWeatherMap API key in [lib/constants/app_constants.dart](lib/constants/app_constants.dart):
   ```dart
   static const String apiKey = 'YOUR_API_KEY_HERE';
   ```
   > A free account at [openweathermap.org](https://openweathermap.org) is sufficient — the app uses the free 2.5 Current Weather endpoint.

4. Run the app:
   ```bash
   flutter run -d chrome
   # or
   flutter run -d windows
   ```

## Notes

- **Windows desktop build:** If your project path is long (e.g. nested in OneDrive), the Windows build may fail due to the OS 260-character path limit. Use `flutter run -d chrome` instead, or move the project to a shorter path like `C:\dev\weather\`.
- The app uses `metric` units (Celsius) by default. This can be changed in `app_constants.dart` by setting `units` to `imperial` (Fahrenheit) or `standard` (Kelvin).
