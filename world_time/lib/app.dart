import 'package:flutter/material.dart';
import 'package:world_time/core/theme/app_theme.dart';
import 'package:world_time/features/presentation/pages/choose_location.dart';
import 'package:world_time/features/presentation/pages/home.dart';
import 'package:world_time/features/presentation/pages/loading.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Time',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    );
  }
}
