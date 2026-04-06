class AppConstants {
  // OpenWeatherMap Current Weather API 2.5 (free tier)
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  // Replace with your actual OpenWeatherMap API key
  static const String apiKey = 'f3634617bbb96559e22fe14cc6fdd372';

  // Units: 'metric' (Celsius), 'imperial' (Fahrenheit), 'standard' (Kelvin)
  static const String units = 'metric';

  // Lottie animation asset paths
  static const String sunnnyAnimation = 'assets/sunny.json';
  static const String cloudyAnimation = 'assets/cloudy.json';
  static const String rainAnimation = 'assets/rain.json';
  static const String snowAnimation = 'assets/snowing.json';
  static const String fogAnimation = 'assets/fog.json';
  static const String thunderstormAnimation = 'assets/thunderstorm.json';
  static const String unknownAnimation = 'assets/unknown.json';
}
