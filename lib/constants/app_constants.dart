class AppConstants {
  // OpenWeatherMap One Call API 3.0 base URL
  static const String baseUrl =
      'https://api.openweathermap.org/data/3.0/onecall';

  // Replace with your actual OpenWeatherMap API key
  static const String apiKey = 'YOUR_API_KEY_HERE';

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
