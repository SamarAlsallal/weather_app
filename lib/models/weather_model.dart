class WeatherModel {
  final String cityName;
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final String? img;
  final double avgTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    this.img,
    required this.avgTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherCondition:
          json['forecast']['forecastday'][0]['day']['condition']['text'],
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
