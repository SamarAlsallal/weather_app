import 'package:weather_app/models/weather_model.dart';

class GetWeatherState {}
class WeatherLoadedState extends GetWeatherState{
    final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
    
}
class WeatherInitialState extends GetWeatherState{}
class FailuerWeatherState  extends GetWeatherState{}