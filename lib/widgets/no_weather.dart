import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('there is no weather 😔', style: TextStyle(fontSize: 24)),
            Text('start searching now 🔍', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
