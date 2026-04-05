import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_constants.dart';

/// Maps an OpenWeatherMap condition ID to the correct Lottie asset path.
/// See: https://openweathermap.org/weather-conditions
String _assetForConditionId(int id) {
  if (id >= 200 && id < 300) return AppConstants.thunderstormAnimation;
  if (id >= 300 && id < 600) return AppConstants.rainAnimation;
  if (id >= 600 && id < 700) return AppConstants.snowAnimation;
  if (id >= 700 && id < 800) return AppConstants.fogAnimation;
  if (id == 800) return AppConstants.sunnnyAnimation;
  if (id > 800) return AppConstants.cloudyAnimation;
  return AppConstants.unknownAnimation;
}

class WeatherAnimation extends StatelessWidget {
  final int conditionId;
  final double size;

  const WeatherAnimation({
    super.key,
    required this.conditionId,
    this.size = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      _assetForConditionId(conditionId),
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
