import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

/// Service class to fetch world time data from the WorldTimeAPI
class WorldTimeApi {
  final String location;
  final String flag;
  final String url;

  String time = '';
  bool isDaytime = true;
  String? errorMessage;

  WorldTimeApi({
    required this.location,
    required this.flag,
    required this.url,
  });

  /// Fetches the current time for the specified timezone
  /// Returns true if successful, false otherwise
  Future<bool> getTime() async {
    try {
      // Make API request with timeout
      final response = await http
          .get(
            Uri.parse('https://worldtimeapi.org/api/timezone/$url'),
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw Exception('Request timed out'),
          );

      if (response.statusCode != 200) {
        throw Exception('Failed to load time data: ${response.statusCode}');
      }

      final Map<String, dynamic> data = jsonDecode(response.body);

      // Get properties from data
      final String datetime = data['datetime'];
      final String utcOffset = data['utc_offset'];

      // Parse the UTC offset properly (handles formats like +05:30, -08:00, +00:00)
      final Duration offsetDuration = _parseUtcOffset(utcOffset);

      // Create DateTime object and apply offset
      DateTime now = DateTime.parse(datetime);
      now = now.add(offsetDuration);

      // Determine if it's daytime (6 AM to 8 PM)
      isDaytime = now.hour >= 6 && now.hour < 20;

      // Format time
      time = DateFormat.jm().format(now);
      errorMessage = null;

      return true;
    } catch (e) {
      time = '';
      errorMessage = 'Could not get time data';
      return false;
    }
  }

  /// Parses UTC offset string (e.g., "+05:30", "-08:00") to Duration
  Duration _parseUtcOffset(String offset) {
    final isNegative = offset.startsWith('-');
    final parts = offset.substring(1).split(':');

    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = parts.length > 1 ? (int.tryParse(parts[1]) ?? 0) : 0;

    final totalMinutes = hours * 60 + minutes;
    return Duration(minutes: isNegative ? -totalMinutes : totalMinutes);
  }

  @override
  String toString() => 'WorldTimeApi(location: $location, time: $time)';
}
