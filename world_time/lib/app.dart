import 'package:flutter/material.dart';
import 'package:world_time/features/presentation/pages/choose_location.dart';
import 'package:world_time/features/presentation/pages/home.dart';
import 'package:world_time/features/presentation/pages/loading.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}
