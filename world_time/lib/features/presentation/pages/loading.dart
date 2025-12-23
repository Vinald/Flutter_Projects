import 'package:flutter/material.dart';
import 'package:world_time/features/data/services/world_time_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setUpWorldTime() async {
    WorldTimeApi instance = WorldTimeApi(
      location: 'Berlin',
      flag: 'germany.png',
      url: 'Europe/Berlin',
    );
    await instance.getTime();

    // Check if widget is still mounted before using context
    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {
          'location': instance.location,
          'flag': instance.flag,
          'time': instance.time,
        },
      );
      setState(() {
        time = instance.time;
      });
    }
  }

  @override
  void initState() {
    setUpWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: SpinKitFadingCircle(
        color: Colors.blue,
        size: 80.0,
      ),
    ));
  }
}
