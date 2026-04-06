import 'package:flutter/material.dart';
import '../models/weather_response.dart';
import '../services/weather_service.dart';
import '../widgets/weather_animation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();

  WeatherResponse? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _searchWeather() async {
    final city = _cityController.text.trim();
    if (city.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final weather = await _weatherService.fetchWeatherByCity(city);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      hintText: 'Enter city name...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _searchWeather(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isLoading ? null : _searchWeather,
                  child: const Text('Search'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              )
            else if (_weather != null)
              _buildWeatherCard(_weather!)
            else
              const Text(
                'Search for a city to see the weather.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherCard(WeatherResponse w) {
    final condition = w.weather.isNotEmpty ? w.weather.first : null;

    return Column(
      children: [
        Text(
          '${w.cityName}, ${w.country}',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        if (condition != null) ...[
          const SizedBox(height: 8),
          WeatherAnimation(conditionId: condition.id, size: 180),
          Text(
            condition.description[0].toUpperCase() +
                condition.description.substring(1),
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
        const SizedBox(height: 16),
        Text(
          '${w.temp.round()}°C',
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w300),
        ),
        Text(
          'Feels like ${w.feelsLike.round()}°C',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          'H: ${w.tempMax.round()}°  L: ${w.tempMin.round()}°',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),
        _buildDetailGrid(w),
      ],
    );
  }

  Widget _buildDetailGrid(WeatherResponse w) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2.5,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        _detailTile(Icons.water_drop, 'Humidity', '${w.humidity}%'),
        _detailTile(Icons.compress, 'Pressure', '${w.pressure} hPa'),
        _detailTile(Icons.air, 'Wind', '${w.windSpeed} m/s'),
        _detailTile(Icons.visibility, 'Visibility', '${(w.visibility / 1000).toStringAsFixed(1)} km'),
        _detailTile(Icons.cloud, 'Cloud Cover', '${w.clouds}%'),
        _detailTile(Icons.thermostat, 'Units', 'Metric (°C)'),
      ],
    );
  }

  Widget _detailTile(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.deepPurple),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
