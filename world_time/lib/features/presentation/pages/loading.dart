import 'package:flutter/material.dart';
import 'package:world_time/features/data/services/world_time_api.dart';

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

  @override
  void initState() {
    setUpWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(50.0), child: Text(time)),
    );
  }
}
