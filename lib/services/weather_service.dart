import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../models/weather_response.dart';

class WeatherService {
  Future<WeatherResponse> fetchWeatherByCity(String city) async {
    final uri = Uri.parse(
      '${AppConstants.baseUrl}'
      '?q=${Uri.encodeComponent(city)}'
      '&units=${AppConstants.units}'
      '&appid=${AppConstants.apiKey}',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('City not found. Please check the name and try again.');
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}
