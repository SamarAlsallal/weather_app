import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = 'api.weatherapi.com/v1';
  final String apiKey = '8908cd2b29b04ff295c135640261601';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response respone = await dio.get(
        'https://$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1',
      );

      WeatherModel weathermodel = WeatherModel.fromJson(respone.data);
      return weathermodel;
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error']['message'] ?? 'Failed, there is an error';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Failed, there is an error');
    }
  }
}
