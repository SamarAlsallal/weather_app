import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/state/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/state/get_weather_state.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import 'package:weather_app/views/serach_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, GetWeatherState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(
              'Weather App',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: state is WeatherLoadedState
                ? Colors.transparent
                : Colors.blue,
            elevation: 0,

            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SerachView()),
                  );
                },
                icon: const Icon(Icons.search, color: Colors.white),
              ),
            ],
          ),

          body: state is WeatherLoadedState
              ? WeatherInfoBody(weather: state.weatherModel)
              : state is WeatherInitialState
              ? NoWeather()
              : const Center(child: Text("Opp's, there is an error")),
        );
      },
    );
  }
}
