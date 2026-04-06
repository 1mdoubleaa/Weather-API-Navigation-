class WeatherResponse {
  final String cityName;
  final String country;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final int windDeg;
  final int visibility;
  final int clouds;
  final int sunrise;
  final int sunset;
  final List<WeatherCondition> weather;

  WeatherResponse({
    required this.cityName,
    required this.country,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDeg,
    required this.visibility,
    required this.clouds,
    required this.sunrise,
    required this.sunset,
    required this.weather,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      cityName: json['name'],
      country: json['sys']['country'],
      temp: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      windDeg: json['wind']['deg'],
      visibility: json['visibility'],
      clouds: json['clouds']['all'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      weather: (json['weather'] as List)
          .map((w) => WeatherCondition.fromJson(w))
          .toList(),
    );
  }
}

class WeatherCondition {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
