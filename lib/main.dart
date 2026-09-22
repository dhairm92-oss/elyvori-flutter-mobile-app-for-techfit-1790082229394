import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/gym_service.dart';
import 'screens/main_container.dart';

void main() {
  run(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GymService()),
      ],
      child: const TechFitApp(),
    ),
  );
}

void run(Widget app) {
  runApp(app);
}

class TechFitApp extends StatelessWidget {
  const TechFitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechFit Gym',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF00E676),
        scaffoldBackgroundColor: const Color(0xFF121218),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E676),
          secondary: Color(0xFF00E676),
        ),
        fontFamily: 'Roboto',
      ),
      home: const MainContainer(),
    );
  }
}
