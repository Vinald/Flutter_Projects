import 'package:flutter/material.dart';
import 'package:world_time/core/theme/app_theme.dart';
import 'package:world_time/features/data/models/location_model.dart';
import 'package:world_time/features/data/services/world_time_api.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final TextEditingController _searchController = TextEditingController();
  List<LocationModel> _filteredLocations = WorldLocations.all;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredLocations = WorldLocations.all;
      } else {
        _filteredLocations = WorldLocations.search(_searchController.text);
      }
    });
  }

  Future<void> _selectLocation(LocationModel location) async {
    setState(() => _isLoading = true);

    final worldTime = WorldTimeApi(
      location: location.location,
      flag: location.flag,
      url: location.url,
    );

    await worldTime.getTime();

    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.pop(context, {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time': worldTime.time,
        'isDaytime': worldTime.isDaytime,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Group locations by region
    final Map<String, List<LocationModel>> groupedLocations = {};
    for (final location in _filteredLocations) {
      final region = location.region ?? 'Other';
      groupedLocations.putIfAbsent(region, () => []).add(location);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text('Choose Location'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Search bar
              Container(
                color: AppColors.primary,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search cities...',
                    hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              // Location list
              Expanded(
                child: _filteredLocations.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_off,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No locations found',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 8),
                        itemCount: groupedLocations.length,
                        itemBuilder: (context, index) {
                          final region = groupedLocations.keys.elementAt(index);
                          final locations = groupedLocations[region]!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                                child: Text(
                                  region,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              ...locations.map((location) => _LocationTile(
                                    location: location,
                                    onTap: () => _selectLocation(location),
                                  )),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _LocationTile extends StatelessWidget {
  final LocationModel location;
  final VoidCallback onTap;

  const _LocationTile({
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        onTap: onTap,
        leading: Text(
          location.flag,
          style: const TextStyle(fontSize: 32),
        ),
        title: Text(
          location.location,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          location.url.replaceAll('_', ' '),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
