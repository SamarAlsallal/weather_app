import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/state/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/state/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          Color themeColor = getThemeColor(
            state is WeatherLoadedState
                ? state.weatherModel.weatherCondition
                : null,
          );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
              primarySwatch:
              getThemeColor(
                        state is WeatherLoadedState
                            ? state.weatherModel.weatherCondition
                            : null,
                      )
                      as MaterialColor,
            ),
            home: HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherCondition) {
  if (weatherCondition == null) return Colors.blue;

  weatherCondition = weatherCondition.toLowerCase();

  if (weatherCondition.contains('sunny')) {
    return Colors.amber;
  } else if (weatherCondition.contains('partly cloudy')) {
    return Colors.blue;
  } else if (weatherCondition.contains('snow')) {
    return Colors.blueGrey;
  } else if (weatherCondition.contains('mist') ||
      weatherCondition.contains('fog') ||
      weatherCondition.contains('haze')) {
    return Colors.blueGrey;
  } else if (weatherCondition.contains('drizzle') ||
      weatherCondition.contains('rain')) {
    return Colors.indigo;
  } else if (weatherCondition.contains('cloudy') ||
      weatherCondition.contains('blizzard') ||
      weatherCondition.contains('clear') ||
      weatherCondition.contains('overcast')) {
    return Colors.lightBlue;
  } else if (weatherCondition.contains('thunder')) {
    return Colors.purple;
  } else {
    return Colors.blue;
  }
}
