import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/core/theme/app_theme.dart';
import 'package:world_time/features/data/services/world_time_api.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  String _statusMessage = 'Fetching world time...';
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _fetchWorldTime();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _fetchWorldTime() async {
    final worldTime = WorldTimeApi(
      location: 'Berlin',
      flag: '🇩🇪',
      url: 'Europe/Berlin',
    );

    final success = await worldTime.getTime();

    if (mounted) {
      if (success) {
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {
            'location': worldTime.location,
            'flag': worldTime.flag,
            'time': worldTime.time,
            'isDaytime': worldTime.isDaytime,
          },
        );
      } else {
        setState(() {
          _hasError = true;
          _statusMessage = worldTime.errorMessage ?? 'Failed to load time';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                // App logo/icon
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.public,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                // App title
                const Text(
                  'World Time',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Know the time anywhere',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.7),
                    letterSpacing: 2,
                  ),
                ),
                const Spacer(flex: 2),
                // Loading indicator or error
                if (_hasError) ...[
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.red[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _statusMessage,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red[300],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _hasError = false;
                        _statusMessage = 'Fetching world time...';
                      });
                      _fetchWorldTime();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                    ),
                  ),
                ] else ...[
                  const SpinKitPulsingGrid(
                    color: Colors.white,
                    size: 60,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _statusMessage,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
                const Spacer(),
                // Footer
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Text(
                    'Powered by WorldTimeAPI',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
