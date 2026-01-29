import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/state/get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;

  Future<void> getCurrentWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityName);

      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(FailuerWeatherState());
    }
  }
}
