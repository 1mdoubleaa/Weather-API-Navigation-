import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../models/weather_response.dart';

class WeatherService {
  Future<WeatherResponse> fetchWeather(double lat, double lon) async {
    final uri = Uri.parse(
      '${AppConstants.baseUrl}'
      '?lat=$lat&lon=$lon'
      '&exclude=minutely,hourly,alerts'
      '&units=${AppConstants.units}'
      '&appid=${AppConstants.apiKey}',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}
