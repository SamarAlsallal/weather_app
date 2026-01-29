import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    MaterialColor themeColor = getThemeColor(weather.weatherCondition);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [themeColor, themeColor[400]!, themeColor[300]!],
          stops: const [0.1, 0.5, 0.9],
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Updated: ${weather.date.hour}:${weather.date.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 32),

            
            Image.network('https:${weather.img}', width: 110, height: 110),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '${weather.avgTemp.round()}°',
                style: const TextStyle(
                  fontSize: 70, 
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
            ),

            Text(
              weather.weatherCondition.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                letterSpacing: 3,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 48),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ), 
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, 
                  children: [
                    _buildWeatherStat(
                      'MAX',
                      '${weather.maxTemp.round()}°',
                      Icons.wb_sunny_outlined,
                    ),
                    Container(width: 1, height: 25, color: Colors.white24),
                    _buildWeatherStat(
                      'MIN',
                      '${weather.minTemp.round()}°',
                      Icons.nightlight_round_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherStat(String label, String value, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
