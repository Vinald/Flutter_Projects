import 'package:flutter/material.dart';
import 'package:world_time/core/theme/app_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Get data from route arguments
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    final bool isDaytime = data['isDaytime'] ?? true;
    final String time = data['time'] ?? '--:--';
    final String location = data['location'] ?? 'Unknown';
    final String flag = data['flag'] ?? '🌍';

    // Determine background gradient based on time of day
    final List<Color> backgroundGradient = isDaytime
        ? [
            const Color(0xFF87CEEB), // Sky blue
            const Color(0xFF1E90FF), // Dodger blue
          ]
        : [
            const Color(0xFF0F0C29), // Dark purple
            const Color(0xFF302B63), // Purple
            const Color(0xFF24243E), // Dark blue
          ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: backgroundGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top bar with edit location button
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextButton.icon(
                        onPressed: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            '/location',
                          );
                          if (result != null && result is Map) {
                            setState(() {
                              data = result;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.edit_location_alt,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Change Location',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Main content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Sun/Moon icon
                    Icon(
                      isDaytime ? Icons.wb_sunny : Icons.nightlight_round,
                      size: 100,
                      color: isDaytime ? Colors.yellow : Colors.white,
                    ),
                    const SizedBox(height: 32),

                    // Location with flag
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          flag,
                          style: const TextStyle(fontSize: 36),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Time display
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 4,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black.withValues(alpha: 0.3),
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Daytime indicator
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isDaytime
                            ? AppColors.accent.withValues(alpha: 0.3)
                            : AppColors.primaryLight.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isDaytime ? Icons.light_mode : Icons.dark_mode,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isDaytime ? 'Daytime' : 'Nighttime',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Footer
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'World Time',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.5),
                    letterSpacing: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
