/// Model class representing a world location with timezone information
class LocationModel {
  final String location;
  final String flag;
  final String url;
  final String? region;

  const LocationModel({
    required this.location,
    required this.flag,
    required this.url,
    this.region,
  });

  /// Creates a copy of this location with the given fields replaced
  LocationModel copyWith({
    String? location,
    String? flag,
    String? url,
    String? region,
  }) {
    return LocationModel(
      location: location ?? this.location,
      flag: flag ?? this.flag,
      url: url ?? this.url,
      region: region ?? this.region,
    );
  }

  @override
  String toString() => 'LocationModel(location: $location, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationModel &&
        other.location == location &&
        other.flag == flag &&
        other.url == url;
  }

  @override
  int get hashCode => location.hashCode ^ flag.hashCode ^ url.hashCode;
}

/// Predefined list of world locations with their timezone information
class WorldLocations {
  static const List<LocationModel> all = [
    // Africa
    LocationModel(
      location: 'Cairo',
      flag: '🇪🇬',
      url: 'Africa/Cairo',
      region: 'Africa',
    ),
    LocationModel(
      location: 'Lagos',
      flag: '🇳🇬',
      url: 'Africa/Lagos',
      region: 'Africa',
    ),
    LocationModel(
      location: 'Nairobi',
      flag: '🇰🇪',
      url: 'Africa/Nairobi',
      region: 'Africa',
    ),
    LocationModel(
      location: 'Johannesburg',
      flag: '🇿🇦',
      url: 'Africa/Johannesburg',
      region: 'Africa',
    ),
    LocationModel(
      location: 'Casablanca',
      flag: '🇲🇦',
      url: 'Africa/Casablanca',
      region: 'Africa',
    ),

    // Americas
    LocationModel(
      location: 'New York',
      flag: '🇺🇸',
      url: 'America/New_York',
      region: 'Americas',
    ),
    LocationModel(
      location: 'Los Angeles',
      flag: '🇺🇸',
      url: 'America/Los_Angeles',
      region: 'Americas',
    ),
    LocationModel(
      location: 'Chicago',
      flag: '🇺🇸',
      url: 'America/Chicago',
      region: 'Americas',
    ),
    LocationModel(
      location: 'Toronto',
      flag: '🇨🇦',
      url: 'Canada/Eastern',
      region: 'Americas',
    ),
    LocationModel(
      location: 'Vancouver',
      flag: '🇨🇦',
      url: 'Canada/Pacific',
      region: 'Americas',
    ),
    LocationModel(
      location: 'Mexico City',
      flag: '🇲🇽',
      url: 'America/Mexico_City',
      region: 'Americas',
    ),
    LocationModel(
      location: 'São Paulo',
      flag: '🇧🇷',
      url: 'America/Sao_Paulo',
      region: 'Americas',
    ),
    LocationModel(
      location: 'Buenos Aires',
      flag: '🇦🇷',
      url: 'America/Argentina/Buenos_Aires',
      region: 'Americas',
    ),
    LocationModel(
      location: 'Lima',
      flag: '🇵🇪',
      url: 'America/Lima',
      region: 'Americas',
    ),

    // Asia
    LocationModel(
      location: 'Tokyo',
      flag: '🇯🇵',
      url: 'Asia/Tokyo',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Seoul',
      flag: '🇰🇷',
      url: 'Asia/Seoul',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Shanghai',
      flag: '🇨🇳',
      url: 'Asia/Shanghai',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Hong Kong',
      flag: '🇭🇰',
      url: 'Asia/Hong_Kong',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Singapore',
      flag: '🇸🇬',
      url: 'Asia/Singapore',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Mumbai',
      flag: '🇮🇳',
      url: 'Asia/Kolkata',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Delhi',
      flag: '🇮🇳',
      url: 'Asia/Kolkata',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Dubai',
      flag: '🇦🇪',
      url: 'Asia/Dubai',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Bangkok',
      flag: '🇹🇭',
      url: 'Asia/Bangkok',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Jakarta',
      flag: '🇮🇩',
      url: 'Asia/Jakarta',
      region: 'Asia',
    ),
    LocationModel(
      location: 'Manila',
      flag: '🇵🇭',
      url: 'Asia/Manila',
      region: 'Asia',
    ),

    // Europe
    LocationModel(
      location: 'London',
      flag: '🇬🇧',
      url: 'Europe/London',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Paris',
      flag: '🇫🇷',
      url: 'Europe/Paris',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Berlin',
      flag: '🇩🇪',
      url: 'Europe/Berlin',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Rome',
      flag: '🇮🇹',
      url: 'Europe/Rome',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Madrid',
      flag: '🇪🇸',
      url: 'Europe/Madrid',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Amsterdam',
      flag: '🇳🇱',
      url: 'Europe/Amsterdam',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Moscow',
      flag: '🇷🇺',
      url: 'Europe/Moscow',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Istanbul',
      flag: '🇹🇷',
      url: 'Europe/Istanbul',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Athens',
      flag: '🇬🇷',
      url: 'Europe/Athens',
      region: 'Europe',
    ),
    LocationModel(
      location: 'Stockholm',
      flag: '🇸🇪',
      url: 'Europe/Stockholm',
      region: 'Europe',
    ),

    // Oceania
    LocationModel(
      location: 'Sydney',
      flag: '🇦🇺',
      url: 'Australia/Sydney',
      region: 'Oceania',
    ),
    LocationModel(
      location: 'Melbourne',
      flag: '🇦🇺',
      url: 'Australia/Melbourne',
      region: 'Oceania',
    ),
    LocationModel(
      location: 'Auckland',
      flag: '🇳🇿',
      url: 'Pacific/Auckland',
      region: 'Oceania',
    ),
    LocationModel(
      location: 'Fiji',
      flag: '🇫🇯',
      url: 'Pacific/Fiji',
      region: 'Oceania',
    ),
  ];

  /// Get locations filtered by region
  static List<LocationModel> byRegion(String region) {
    return all.where((loc) => loc.region == region).toList();
  }

  /// Search locations by name
  static List<LocationModel> search(String query) {
    final lowerQuery = query.toLowerCase();
    return all
        .where((loc) =>
            loc.location.toLowerCase().contains(lowerQuery) ||
            (loc.region?.toLowerCase().contains(lowerQuery) ?? false))
        .toList();
  }

  /// Get all unique regions
  static List<String> get regions {
    return all
        .map((loc) => loc.region)
        .whereType<String>()
        .toSet()
        .toList()
      ..sort();
  }
}
