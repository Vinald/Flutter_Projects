/// Application string constants
class AppStrings {
  // App Info
  static const String appName = 'World Time';
  static const String appTagline = 'Know the time anywhere';

  // Loading Screen
  static const String loadingMessage = 'Fetching world time...';
  static const String loadingError = 'Could not get time data';
  static const String retryButton = 'Retry';

  // Home Screen
  static const String changeLocation = 'Change Location';
  static const String daytime = 'Daytime';
  static const String nighttime = 'Nighttime';

  // Choose Location Screen
  static const String chooseLocation = 'Choose Location';
  static const String searchHint = 'Search cities...';
  static const String noLocationsFound = 'No locations found';

  // Error Messages
  static const String networkError = 'Network error. Please check your connection.';
  static const String timeoutError = 'Request timed out. Please try again.';
  static const String unknownError = 'Something went wrong. Please try again.';

  // API
  static const String worldTimeApiBase = 'https://worldtimeapi.org/api/timezone';
  static const String poweredBy = 'Powered by WorldTimeAPI';
}

/// Default location settings
class AppDefaults {
  static const String defaultLocation = 'Berlin';
  static const String defaultFlag = '🇩🇪';
  static const String defaultTimezone = 'Europe/Berlin';
}
